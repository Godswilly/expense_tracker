class AddAuthorIdToGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :author_id, :integer
  end
end
