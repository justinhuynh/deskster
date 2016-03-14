class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :body
      t.string :username
      t.integer :item_id
    end
  end
end
