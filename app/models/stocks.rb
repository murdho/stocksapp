class Stocks < ActiveRecord::Base
  attr_accessible :name, :percent, :price, :quantity, :value, :years
end
