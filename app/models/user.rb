class User < ActiveRecord::Base
  ajaxful_rateable :stars => 10, :dimensions => [:speed, :beauty, :price]

end
