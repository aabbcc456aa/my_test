# To change this template, choose Tools | Templates
# and open the template in the editor.

class WebServiceTest< ActiveRecord::Base



  def self.create_model
    warn_message = WarnMessage.new
      warn_message.diagnosis = "huxiaolong"
      warn_message.equipmentNo = "123456789"
      warn_message.faultDesc = "胡晓龙"
      warn_message.faultLevel = "1"
      warn_message.orgin_id = "8888888"
      warn_message.occurTime = Time.now.to_s
     # puts warn_message
      to_xml = warn_message.to_xml
      send_web(to_xml)
  end

  def self.send_web(xml)
    require "soap/wsdlDriver"
    url = 'http://192.168.3.147:3000/warn_message/wsdl'
    client = SOAP::WSDLDriverFactory.new(url).create_rpc_driver
    send_ok = client.get_warn_messages(xml)
    puts send_ok
  end
end
