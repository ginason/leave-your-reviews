class AddProductId < ActiveRecord::Migration[5.1]
  def change
    change_table :reviews do |t|
      t.belongs_to :product, index: true
    end
  end
end
