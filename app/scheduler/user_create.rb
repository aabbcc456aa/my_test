## To change this template, choose Tools | Templates
## and open the template in the editor.
#
#class UserCreate
#
#  attr_reader :scheduler
#  def initialize
#     @scheduler = Rufus::Scheduler.start_new(:thread_name => 'remind scheduler')
#  end
#
#  def start
#     user = User.new(:name=>"xiaohu",:age=>23,:remark=>"love lou")
#  user.save!
#    scheduler.every '3s' do
#       4.times do
#           puts "hello!"
#          sleep 1
#        end
#    end
#  end
#end
