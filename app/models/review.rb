class Review < ApplicationRecord
  validates :product_id, presence: true
  belongs_to :products
end
