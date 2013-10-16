# == Schema Information
#
# Table name: devices
#
#  id                :integer          not null, primary key
#  device_identifier :string(255)
#  registration_id   :string(255)
#  device_type       :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Device < ActiveRecord::Base
  # attr_accessible  :device_type, :registration_id,:device_identifier
end
