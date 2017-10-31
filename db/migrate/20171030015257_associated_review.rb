class AssociatedReview < ActiveRecord::Migration[5.1]
  def change
    add_reference :reviews, :products, index: true
  end
end
