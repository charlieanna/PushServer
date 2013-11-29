require 'androidpush'
require 'applepush'
#
class PushController < ApplicationController
  respond_to :json
  def feedback
    ApplePush.new.feedback
    render nothing: true, status: 200, content_type: 'text/html'
  end

  # def push
 #    device_identifiers_string = params[:push][:devices]
 #    message = params[:push][:message]
 #    device_identifiers_string.each do |device|
 #      device = Device.find_by_device_identifier(device[:device_identifier])
 #      send_push(device, message)
 #    end
 #  render nothing: true
 #  end

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
