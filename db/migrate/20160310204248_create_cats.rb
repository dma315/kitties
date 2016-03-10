class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :url, null: false
      t.string :name
      t.text :comment
      t.integer :elo_score, null: false

      t.timestamps null: false
    end
  end
end
