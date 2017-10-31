class CreateReferenceProduct < ActiveRecord::Migration[5.1]
  def change
    add_reference :reviews, :product, index: true
  end
end
