require 'rubygems'
require 'net/http'
require 'net/https'
require 'uri'
#
class AndroidPush
  def push(body)
    uri = URI('https://android.googleapis.com/gcm/send')
    headers = { 'Content-Type' => 'application/json',
                'Authorization' => 'key=AIzaSyCoTPiIlC9OKuLh6i66focOp3zygWWOKXs' }
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    http.post(uri.path, body.to_json, headers)
  end
end
