class Product < ApplicationRecord
  validates :url, presence: true
  has_many :reviews
end
