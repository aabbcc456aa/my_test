# To change this template, choose Tools | Templates
# and open the template in the editor.

class WarnMessageController  < ApplicationController
 # web_service_dispatching_mode :delegated
#  web_service_dispatching_mode :direct
# wsdl_service_name 'GoogleSearch'
  wsdl_service_name 'WarnMessageWs'
  web_service_api WarnMessageApi
  web_service_scaffold :invoke

  def index
    @hash = WarnMessage.create_model
  end

  def get_warn_messages(json)
    puts "----------json------------------"
    puts json
     puts "------------json----------------"
#    root_hash  =  ActiveSupport::JSON.decode(json)

##    root_element =Hash.from_xml(xml)
     puts "----------root_hash------------------"
#      puts root_hash
     puts "------------root_hash----------------"
#    root_hash = Hash.from_xml(xml)
#     puts "----------root_hash------------------"
#    puts root_hash
#    puts root_hash.class
#     puts "------------root_hash----------------"
#    warn_message = WarnMessage.new
#    warn_message.faultDesc = root_hash["divice_id"]
#    puts root_hash["divice_id"]
#    if warn_message.save
      return true
#    else
#      return false
#    end
  end

  def invoke
    puts "invoke"
  end
end

