# -*- encoding: utf-8 -*-
$:.unshift(File.expand_path('../../lib', __FILE__))
require 'onstomp'

puts "Starting demo"
puts "----------------------------"

running = true
client = OnStomp::Client.new('stomp://system:manager@192.168.3.159:61613')
client.connect

puts "Connected to broker using protocol #{client.connection.version}"

client.subscribe("/queue/test") do |message|
  puts "Received: '#{message.body}'"
#  if message.body == 'finished'
#    running = false
#  end
end

#client.send("/queue/onstomp/test", "hello world")
#client.send("/queue/onstomp/test", "this is a simple demo of onstomp")
#client.send("/queue/onstomp/test", "finished")

Thread.pass while running
client.disconnect
puts "----------------------------"
puts "End of demo"

# Example output:
#
#
# Starting demo
# ----------------------------
# Connected to broker using protocol 1.0
# Received: hello world
# Received: this is a simple demo of onstomp
# Received: finished
# ----------------------------
# End of demo
