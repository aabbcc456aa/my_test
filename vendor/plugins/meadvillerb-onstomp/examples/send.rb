$:.unshift(File.expand_path('../../lib', __FILE__))
require 'onstomp'

puts "Starting demo"
puts "----------------------------"

client = OnStomp.connect('tcp://:@192.168.3.175:61616')
#puts "33333333333"
#client.send('/queue/onstomp-test', 'hello world')
#client.disconnect
#
#require 'rubygems'
#require 'stomp'
client = OnStomp::Client.connect('', '','192.168.3.175', 61616, false)
puts "33333333333333333333333333"