class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :notified_by_id
      t.integer :micropost_id
      t.integer :like_id
      t.integer :relationship_id
      t.boolean :read
      t.string  :notified_type
      t.timestamps
    end
    add_index :notifications, :user_id
    add_index :notifications, :notified_by_id
    add_index :notifications, :like_id
    add_index :notifications, :relationship_id
  end
end
