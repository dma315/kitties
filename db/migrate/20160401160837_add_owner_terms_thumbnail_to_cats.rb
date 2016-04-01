class AddOwnerTermsThumbnailToCats < ActiveRecord::Migration
  def change
    add_column :cats, :owner_id, :integer
    add_column :cats, :terms_accepted, :boolean
    add_column :cats, :thumbnail_url, :string
    remove_column :cats, :comment
    add_index :cats, :owner_id
  end
end