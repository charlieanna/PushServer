# == Schema Information
#
# Table name: users
#
#  id                :integer          not null, primary key
#  jabber_id         :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  device_identifier :string(255)
#

class User < ActiveRecord::Base
  
  # attr_accessible :jabber_id,:device_identifier

  
end
