class CreateCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :collections do |t|
      t.string :title
      t.boolean :ordered
      t.timestamps
    end
    create_table :sections do |t|
      t.integer :collection_id, index: true
      t.string :title
      t.timestamps
    end
  end
end
