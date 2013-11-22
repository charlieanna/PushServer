#
class DevicesController < ApplicationController
  def create
    device = Device.find_by_device_identifier(params[:device_identifier])
      if device.nil?
        device = Device.create(device_params)
      else
        unless device.registration_id != params[:registration_id]
          device.registration_id = params[:registration_id]
          device.save
        end
      end
    render text: 'OK'
  end

  private

  def device_params
    params.require(:device).permit(:device_identifier, :registration_id, :device_type)
  end
end
