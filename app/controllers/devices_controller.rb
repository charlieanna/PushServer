
class DevicesController < ApplicationController
  
  def create
    p params
     device = Device.find_by_device_identifier(params[:device_identifier])
     if device == nil
        device = Device.new()
            device.device_identifier =  params[:device_identifier]
            device.registration_id = params[:registration_id]
            
            device.device_type = params[:device_type]
            device.save
            
     else
     
   reg_id = device.registration_id
   puts reg_id
    if reg_id == params[:registration_id]
    
  elsif reg_id != params[:registration_id]
    
    device.registration_id = params[:registration_id]
    device.save
  
     end
    end 
    
    render :text => "OK"
  end
end
