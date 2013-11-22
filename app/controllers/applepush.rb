require 'rubygems'
require 'socket'
require 'applepayload'
require 'ssl_helper'
require 'openssl'
#
class ApplePush
  def push(payload_hash, deviceTokenHex)
    host = 'gateway.sandbox.push.apple.com'
    port = 2195
    path =  Dir.pwd + '/app/controllers/CertificateName.pem'
    ssl_client = ConnectionToAppleServer::ssl_connect(host, port, path)
    ssl_client.connect
    device = []
    device << deviceTokenHex
    device_token_binary = device.pack('H*')
    pt = device_token_binary
    pm = payload_hash.to_json
    message = [0, 0, 32, pt, 0, pm.size, pm].pack('ccca*cca*')
    ssl_client.write(message)
    ssl_client.flush
  end

  def feedback
    path =  Dir.pwd + '/app/controllers/CertificateName.pem'
    ssl_client = ConnectionToAppleServer::ssl_connect('feedback.sandbox.push.apple.com', 2196, path)
    ssl_client.connect
    apns_feedback = []
    while message = ssl_client.gets
      timestamp, _token_size, token = message.unpack('N1n1H*')
      apns_feedback << [Time.at(timestamp), token]
    end
    ssl.close
    sock.close
  end
end
