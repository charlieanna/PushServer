require 'rubygems'
require 'net/http'
require "net/https"
require "uri"
class AndroidPush
  
  def initialize
     puts "here"
        end
  
  def push(body)
  puts "INSIDErfgreer"
    uri = URI('https://android.googleapis.com/gcm/send')
   
   
    headers = { "Content-Type" => "application/json",
                      "Authorization" => "key=AIzaSyCoTPiIlC9OKuLh6i66focOp3zygWWOKXs" }  #AIzaSyAD2fFng7USBcOTsYg-PdcbcXwSWvHFSRo browser key
    
    
  
 
          http = Net::HTTP.new(uri.host, uri.port)
                             http.use_ssl = true
                             http.verify_mode = OpenSSL::SSL::VERIFY_NONE
                   
                             resp, dat = http.post(uri.path, body.to_json, headers)
                   puts "REsponse"
                   puts body
                     puts resp.code.to_i
                     puts dat
           
  
  
    # res = Net::HTTP.start(uri.host, uri.port) do |http|
    #      http.request(req)
    #    end
    
  end



end


