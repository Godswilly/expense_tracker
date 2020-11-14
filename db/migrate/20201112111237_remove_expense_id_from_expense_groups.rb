class RemoveExpenseIdFromExpenseGroups < ActiveRecord::Migration[6.0]
  def change
    remove_column :expense_groups, :expense_id, :integer
  end
end
