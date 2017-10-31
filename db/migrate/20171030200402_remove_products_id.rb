class RemoveProductsId < ActiveRecord::Migration[5.1]
  def change
    remove_column :reviews, :products_id
  end
end
