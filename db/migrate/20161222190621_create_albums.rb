class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.integer :collection_id, index: true
      t.string :spotify_id
      t.string :artist
      t.string :name
      t.integer :year
      t.string :art
      t.integer :position
      t.timestamps
    end
  end
end
