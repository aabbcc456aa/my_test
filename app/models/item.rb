class Item < ActiveRecord::Base
#  has_and_belongs_to_many :orders
belongs_to :orders
belongs_to :cart
end
