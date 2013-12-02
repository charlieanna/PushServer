require 'androidpush'
require 'applepush'
#
class PushController < ApplicationController
  respond_to :json
  def feedback
    ApplePush.new.feedback
    render nothing: true, status: 200, content_type: 'text/html'
  end

  def push
    payload_hash = {}
    payload_hash['aps'] = {}
    payload_hash['aps']['alert'] = {}
    payload_hash['aps']['alert']['body'] = "You have a new asdsada"
    payload_hash['aps']['sound'] = 'default'
    payload_hash['aps']['badge'] = 1
    payload_hash['app'] = "dsfsdf"
    payload_hash['url'] = "dsfdfdsf"
    device_token_hex = "0C2C51D03FA6126CD25537F7CA68B32685B129629EE512DD8B0A4B61CB9B76B9"
    puts "AAAAAA"
    puts payload_hash
    ApplePush.new.push(payload_hash, device_token_hex)
     render nothing: true, status: 200
  end

  def push1
    app = params[:push]['app']
    device_identifiers_string =  params[:push]['devices']
    message = params[:push]['message']
    puts device_identifiers_string
    unless device_identifiers_string.nil?
      device_identifiers_string.each do |device|
      
        full_device = Device.find_by(device_identifier: device)
        unless full_device.nil?
          args = {}
          args['id'] = full_device.id
          args['message'] = message
          args['app'] = app
          PygmentsWorker.perform_async(args)  unless full_device.nil? 
        end
       end
     end
    render nothing: true, status: 200
  end

  
end
