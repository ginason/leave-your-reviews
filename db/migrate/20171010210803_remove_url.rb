class RemoveUrl < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :product_url
  end
end
