require 'openssl'
require 'socket'
require 'sslconnection'
module ConnectionToAppleServer

def self.ssl_connect(host, port, cerfile)
  ssl_connect = SSL_Connection.new

  
  ssl_connect.context = OpenSSL::SSL::SSLContext.new
  p cerfile
  key4_pem = File.read(cerfile)
  puts "AAA"
  ssl_connect.context.key = OpenSSL::PKey::RSA.new(key4_pem,"akk322")
   puts "BBBB"
  ssl_connect.context.cert = OpenSSL::X509::Certificate.new(key4_pem)
   puts "CCC"
ssl_connect.tcp_client = TCPSocket.new 'gateway.sandbox.push.apple.com', 2195
  ssl_connect.ssl_client = OpenSSL::SSL::SSLSocket.new ssl_connect.tcp_client, ssl_connect.context
  return ssl_connect.ssl_client
 end
 
def ssl_disconnect(sslcon)
end

end