class Cart < ActiveRecord::Base
  has_one :item
end
