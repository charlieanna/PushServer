require 'rubygems'
require 'socket'
require 'applepayload'
require 'ssl_helper'

require 'openssl'

class ApplePush
  def initialize
    p "init"
  end

def push(payload_hash,deviceTokenHex)
  puts "APPLE"
 # Host for push notification service
  # production: gateway.push.apple.com
  # development: gateway.sandbox.apple.com
  host = 'gateway.sandbox.push.apple.com'
  port = 2195

  # Host for feedback service
  # production: feedback.push.apple.com
  # development: feedback.sandbox.apple.com
  feedback_host = 'feedback.sandbox.push.apple.com'
  feedback_port = 2196

  
  


# if(deviceTokenHex.length < 64 || deviceTokenHex.length > 70)
#   
#       puts "Device Token is to short or to long. Length without spaces should be 64 chars...\n"
#      
#   end
    

      
      ssl_client = ConnectionToAppleServer::ssl_connect(host, port, Dir.pwd + "/app/controllers/CertificateName.pem")
      ssl_client.connect

             device = []
             device << deviceTokenHex

             deviceTokenBinary = device.pack('H*')
             pt = deviceTokenBinary
            # message = "0032#{deviceTokenBinary}0#{payload_hash.to_json.length}#{payload_hash.to_json}"
           #        puts message
      
           pm = payload_hash.to_json
          
          message = [0, 0, 32, pt, 0, pm.size, pm].pack("ccca*cca*")
       puts message
        puts ssl_client
             ssl_client.write(message)
            ssl_client.flush
end


 def feedback
    ssl_client = ConnectionToAppleServer::ssl_connect('feedback.sandbox.push.apple.com', 2196, Dir.pwd + "/app/controllers/CertificateName.pem")
      ssl_client.connect
 
    apns_feedback = []
 
    while message = ssl_client.gets #read(38)
      timestamp, token_size, token = message.unpack('N1n1H*')
      apns_feedback << [Time.at(timestamp), token]
      p message
    end
 
    ssl.close
    sock.close
 
    p apns_feedback
  end
    
   end     
        
  
 