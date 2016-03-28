class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :token
      t.integer :uid
      t.string :provider
      t.string :image_url

      t.timestamps null: false
    end
  end
end
