class RemoveUserIdFromExpenseGroups < ActiveRecord::Migration[6.0]
  def change
    remove_column :expense_groups, :user_id, :string
  end
end
