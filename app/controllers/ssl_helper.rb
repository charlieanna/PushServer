require 'openssl'
require 'socket'
require 'sslconnection'
module ConnectionToAppleServer

def self.ssl_connect(host, port, cerfile)
  ssl_connect = SSLConnection.new
  ssl_connect.context = OpenSSL::SSL::SSLContext.new
  key4_pem = File.read(cerfile)
  ssl_connect.context.key = OpenSSL::PKey::RSA.new(key4_pem,"akk322")
  ssl_connect.context.cert = OpenSSL::X509::Certificate.new(key4_pem)
  ssl_connect.tcp_client = TCPSocket.new 'gateway.sandbox.push.apple.com', 2195
  ssl_connect.ssl_client = OpenSSL::SSL::SSLSocket.new ssl_connect.tcp_client, ssl_connect.context
end
end
