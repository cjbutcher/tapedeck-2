class AddUserIdToCollections < ActiveRecord::Migration[5.0]
  def change
    add_column :collections, :user_id, :integer, index: true
  end
end
