class CreateRelationshipMutes < ActiveRecord::Migration[5.1]
  def change
    create_table :relationship_mutes do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
    add_index :relationship_mutes, :follower_id
    add_index :relationship_mutes, :followed_id
    add_index :relationship_mutes, [:follower_id, :followed_id], unique: true
  end
end
