class AddGenre2ToMicroposts < ActiveRecord::Migration[5.1]
  def change
    add_column :microposts, :genre2, :string
    add_column :microposts, :genre3, :string
  end
end
