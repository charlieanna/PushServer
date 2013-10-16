require 'payload'
class ApplePayload < Payload
  attr_accessor :message,:sound_name,:badge_number,:action_key_caption,:dict
  def initialize message, sound_name,badge_number, action_key_caption,dict
  # /* The Message that is displayed to the user */
      @message = message
   
      # /* The name of the Sound which will be played back */
      @sound_name = sound_name
   
      # /* The Number which is plastered over the icon, 0 disables it */
      @badge_number = badge_number
   
      # /* The Caption of the Action Key the user needs to press to launch the Application */
      @action_key_caption = action_key_caption
   
      # /* Custom Message Dictionary, which is accessible from the Application */
      @dict = dict
    
  end
    
end