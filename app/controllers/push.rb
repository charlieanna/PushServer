#
class Push
  

  
  def send_push(id, message, app)
    device = Device.find(id)
    device_type = device.device_type
    if device_type == 'IOS' && !device_type.nil?
      send_to_ios(device, message, app)
    elsif device_type == 'Android' && !device_type.nil?
      send_to_android(device, message, app)
    end
  end

  def send_to_ios(device, message, app)
   
    payload_hash = {}
    payload_hash['aps'] = {}
    payload_hash['aps']['alert'] = {}
    payload_hash['aps']['alert']['body'] = "You have a new #{app}"
    payload_hash['aps']['sound'] = 'default'
    payload_hash['aps']['badge'] = 1
    payload_hash['app'] = app
    payload_hash['url'] = message
    device_token_hex = device.registration_id
    puts "AAAAAA"
    puts payload_hash
    ApplePush.new.push(payload_hash, device_token_hex)
  end

  def send_to_android(device, message, app)
    body = {}
    arr = []
    arr << device.registration_id
    body['registration_ids'] = arr
      # body['collapse_key'] = 'Updates Available'
      #    body['registration_ids'] = registration_ids
      #    body['data'] = 'Hi this is my first push message'
      #    body['delay_while_idle'] = # true or false
      #    body['time_to_live'] = # number in seconds
    android_payload = { 'message' => message }
    android_payload['app'] = app
    android_payload['url'] = message
    body['data'] = android_payload
    a = AndroidPush.new
    a.push(body)
  end
end
