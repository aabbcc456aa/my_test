class Order < ActiveRecord::Base
#  has_and_belongs_to_many :items
  has_many :items
  accepts_nested_attributes_for :items

  def item=(attributes)
      puts attributes
      puts "-------------------------------------"
    end


end
