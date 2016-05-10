class AddMatchupIdToCats < ActiveRecord::Migration
  def change
    add_column :cats, :matchup_id, :string
    add_index :cats, :matchup_id
  end
end
