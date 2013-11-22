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
    device_identifiers_string = params[:push][:devices]
    message = params[:push][:message]
    device_identifiers_string.each do |device|
      device = Device.find_by_device_identifier(device[:device_identifier])
      send_push(device, message)
    end
  render nothing: true
  end

  def push1
    app = params[:push]['app']
    device_identifiers_string =  push[:push]['devices']
    message = push[:push]['message']
    if device_identifiers_string.nil?
      device_identifiers_string.each do |device|
        full_device = Device.find_by_device_identifier(device)
        send_push(full_device, message, app) if full_device.nil?
      end
    end
    render nothing: true, status: 200
  end

  def send_push(device, message, app)
    device_type = device.device_type
    if device_type == 'IOS' && device_type.nil?
      send_to_ios(device, message, app)
    elsif device_type == 'Android' && device_type.nil?
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
    ApplePush.newpush(payload_hash, device_token_hex)
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
