# http://quickblox.com/developers/How_to_create_APNS_certificates
require 'androidpush'
require 'applepush'
class PushController < ApplicationController
  respond_to :json
  
  def feedback
    ApplePush.new.feedback
    render :nothing => true, :status => 200, :content_type => 'text/html'
  end
  def push
   
   puts params
   puts params[:device_identifier]
   device_identifiers_string = params[:push][:devices]#[0][:device_identifier]
   p device_identifiers_string
   message = params[:push][:message]  # this is the message that has to be sent to all the jabber ids. 
    # devices = device_identifiers_string.split(',') if device_identifiers_string.index(",")
   message_to_send = "You have receieved a message from " + (message)
   #  devices.uniq!
   # puts devices
   
    device_identifiers_string.each do |device|
         
           full_device = Device.find_by_device_identifier(device[:"device_identifier"])
   #        if(full_device != nil)
         
           puts full_device
           send_push(full_device,message)
   #      end
         end
      # device = Device.find_by_device_identifier(device_identifiers_string)
    
     # send_push(device,message)
    #     puts "RENDER"
       render :nothing => true
  end

  def push1
   
   push = params[:push]
   p push
   device_identifiers_string =  push["devices"]
   p device_identifiers_string
   message = push["message"]
   app = push["app"]
   from = push["from"]
   if message != nil
     message_to_send = "You have a new timetable"
   end
   #  devices.uniq!
   # puts devices
   if device_identifiers_string != nil
    device_identifiers_string.each do |device|
         
           full_device = Device.find_by_device_identifier(device)
           if(full_device != nil)
         
           puts full_device
           send_push(full_device,message,app,from)
         end
         end
   end
    
   render :nothing => true, :status => 200
  end

  def send_to_device
  end

 
  
  def send_push(device,message,app,from)
    
    puts "DSVDSVSDVDSSDV"
    device_type = device.device_type
    puts device.registration_id
    if device_type == "IOS" && device_type != nil
      payload_hash = {}
        payload_hash['aps'] = {}
            payload_hash['aps']['alert'] = {}
            payload_hash['aps']['alert']['body'] = "You have a new #{app} from #{from}"
            payload_hash['aps']['sound'] = "default"
            payload_hash['aps']['badge'] = 1
            payload_hash["app"] = app
            payload_hash["url"] = message
      deviceTokenHex = device.registration_id
      b = ApplePush.new
      
      b.push(payload_hash,deviceTokenHex)
    end
    
    if device_type == "Android" && device_type != nil
      puts "VDSVDFVDFFDVDFFDVFFVDF"
       body = {}
       arr = []
       arr << device.registration_id
        body["registration_ids"] = arr
          # body["collapse_key"] = "Updates Available"
          #    body["registration_ids"] = registration_ids
          #    body["data"] = "Hi this is my first push message"
          #    body["delay_while_idle"] = # true or false
          #    body["time_to_live"] = # number in seconds
          android_payload = {"message" => message}
 #  payload_hash['aps'] = {}
 #            payload_hash['aps']['alert'] = {}
 #            payload_hash['aps']['alert']['body'] = "timetable"
 #            payload_hash['aps']['sound'] = "default"
 #            payload_hash['aps']['badge'] = 1
            android_payload["app"] = "timetable"
            android_payload["url"] = message

        body["data"] = android_payload
      puts body.to_json
     

a = AndroidPush.new
puts a
a.push(body)
    end

  end
end
