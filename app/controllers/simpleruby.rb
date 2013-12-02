require 'rubygems'
require 'socket'
require_relative 'ssl_helper'
require_relative 'openssl'

host = 'gateway.push.apple.com'
path =  Dir.pwd + '/app/controllers/ProductionCertificate.pem'
ssl_client = ConnectionToAppleServer::ssl_connect("gateway.push.apple.com", 2195, path)
ssl_client.connect
device = [deviceTokenHex]
device_token_binary = device.pack('H*')
pt = device_token_binary
pm = payload_hash.to_json
puts "fsdfsd"
message = [0, 0, 32, pt, 0, pm.size, pm].pack('ccca*cca*')
ssl_client.write(message)
ssl_client.flush
  
ssl.close
sock.close