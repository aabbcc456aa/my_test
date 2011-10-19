$:.unshift(File.expand_path('../../lib', __FILE__))
require 'onstomp'

puts "Starting demo"
puts "----------------------------"
client = OnStomp::Client.new('stomp://system:manager@192.168.3.159:61613')
client.connect
puts "ccccccccccccccccccccc"
client.subscribe('/queue/test', :ack => 'client') do |m|
  client.ack m
  puts "Got and ACK'd a message: #{m.body}"
end
puts "--------------finish--------------"


#require 'rubygems'
#require 'stomp'
#
#@conn = Stomp::Connection.open '', '', 'tcp://192.168.3.175', 61616, true
#@messages = 10000
#@batches = 40
#@subscribers = 10
#@size = 256
#
#@DATA = "abcdefghijklmnopqrstuvwxyz";
#@body = "";
#for i in 0..(@size-1)
#	@body += @DATA[ i % @DATA.length,1]
#end
#puts "1232322"
#@times = []
#@conn.subscribe 'emp.topic', { :ack =>"auto" }