class Product < ApplicationRecord
  validates :url, presence: true
  validates :price_in_dollar, numericality: {only_integer: true}
  
  has_many :reviews
end
