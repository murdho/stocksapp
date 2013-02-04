class Stock < ActiveRecord::Base
  attr_accessible :name, :percent, :price, :quantity, :value, :years
  
  # Different validations to get correct data.
  validates :name, :length => {:minimum => 2}, :presence => true, :uniqueness => true
  validates :price, :quantity, :percent, :years, :presence => true, :numericality => true
  validates_numericality_of :quantity, :years, :only_integer => true
 end
