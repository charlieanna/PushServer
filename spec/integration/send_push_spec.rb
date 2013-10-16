require 'spec_helper'

feature PushController do
  scenario "Send a push to all the devices" do
    device1 = Device.new
    device1.device_identifier =  "7d94095209b6e051"
    device1.registration_id = "APA91bE1hthMTHV3uTUzIB7befwYTMDQ71Z5_BnTOlLLfOowzTVlMRRCQEPMzG22g3ZefMyAHXAUMVGw9kv_dB_2a9SF-vQSTgQCoHPNvwexLABBKVqtLzd2Ep1lJ-Ha8fyVf7Rz2nHL"
        
    device1.device_type = "Android"
    device1.save

    device2 = Device.new
    device2.device_identifier =  "85718da6d39b75c5"
    device2.registration_id = "APA91bGG6FzcxCZFbcxSdF5uLuGB6irm3R9Ii-4lIQIdcEPyonVHt_r-kXVc6PXT54Opg3P8VQa9VTZRRhxWXEKnfG0cN0VQ-pN4MW847bFCBVlxqf35OqUELpvThm7bsngMlnXkJL5Z"
        
    device2.device_type = "Android"
    device2.save
    
    
    device3 = Device.new
    device3.device_identifier =  "4BA905D6-443D-4631-A7BD-DEDEA1638BA1"
    device3.registration_id = "a078f1658f68521a278d0f5c41b9c4b0613e4a6ddc157fd8ed1567cda5634da4"
    device3.device_type = "IOS"
    device3.save
    
    device4 = Device.new
    device4.device_identifier =  "9dce6d95d8b1ae67"
    device4.registration_id = "APA91bFYjGAp4F4NH5jXqX2hb_4tNIf3Cu6DQtddf3wGt6wzCj6hZRoCjnlgITR4jPSdmLbI85i9x1_8t_0ORkJ1gBv6gTSIezq6RBg-or3leg0x1wgOri4tIzfqQqGdCuz-rB9j2Kyz"
    device4.device_type = "Android"
    device4.save
  

    xhr :post, push_push1_path,push: { devices: [nil,device4.device_identifier,device1.device_identifier,device2.device_identifier,device3.device_identifier], message: "bar" }
    expect(response.code).to eq("200")
  end
end