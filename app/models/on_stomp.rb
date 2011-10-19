#class OnStomp < ActiveRecord::Base
#  def self.test
#    client = OnStomp::Client.new('tcp://192.168.3.240:61616')
#    client.connect
#    client.subscribe('emp.topic', :ack => 'client') do |m|
#       client.ack m
#        puts "Got and ACK'd a message: #{m.body}"
#    end
#  end
#end

$:.unshift(File.expand_path('../../lib', __FILE__))
require 'onstomp'
require 'onstomp/open-uri'


    client = OnStomp::Client.new('tcp://192.168.3.240:61616')
    client.connect
    client.subscribe('emp.topic', :ack => 'client') do |m|
       client.ack m
        puts "Got and ACK'd a message: #{m.body}"
    end