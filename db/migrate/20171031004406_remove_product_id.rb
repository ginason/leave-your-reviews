class RemoveProductId < ActiveRecord::Migration[5.1]
  def change
    remove_column :reviews, :product_id
  end
end
