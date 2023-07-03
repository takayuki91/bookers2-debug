class CreateLooks < ActiveRecord::Migration[6.1]
  def change
    create_table :looks do |t|
      t.integer :user_id, null: false
      t.integer :book_id, null: false

      t.timestamps
    end
  end
end
