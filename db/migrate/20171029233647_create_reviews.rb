class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.text "username"
      t.text "comment"
      t.timestamps
    end
  end
end
