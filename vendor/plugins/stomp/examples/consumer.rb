$:.unshift(File.expand_path('../../lib', __FILE__))
require 'rubygems'
require 'stomp'


client = Stomp::Client.new()
puts "Subscribing ronaldo"
client.subscribe("/queue/ronaldo", {:ack => "client", "activemq.prefetchSize" => 1, "activemq.exclusive" => true }) do |msg|
  File.open("file", "a") do |f|
    f.write(msg.body)
    f.write("\n----------------\n")
  end
  
  client.acknowledge(msg)
end

loop do
  sleep(1)
  puts "."
end
