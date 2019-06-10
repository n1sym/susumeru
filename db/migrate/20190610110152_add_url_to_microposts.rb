class AddUrlToMicroposts < ActiveRecord::Migration[5.1]
  def change
    add_column :microposts, :url, :text
  end
end
