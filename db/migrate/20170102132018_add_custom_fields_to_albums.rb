class AddCustomFieldsToAlbums < ActiveRecord::Migration[5.0]
  def change
    add_column :albums, :custom, :boolean, default: false
  end
end
