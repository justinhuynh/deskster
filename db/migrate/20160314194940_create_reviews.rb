class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :body
      t.string :username
      t.integer :item_id, null: false
    end
  end
end
