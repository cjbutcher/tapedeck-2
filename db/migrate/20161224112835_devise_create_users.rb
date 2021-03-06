class DeviseCreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string     :email,                null: false, default: ""
      t.string     :encrypted_password,   null: false, default: ""
      t.string     :provider
      t.string     :uid
      t.string     :username
      t.timestamps null: false
    end

    add_index :users, :uid
  end
end
