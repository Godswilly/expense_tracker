class RemoveAuthorIdFromExpenseGroups < ActiveRecord::Migration[6.0]
  def change
    remove_column :expense_groups, :author_id, :string
  end
end
