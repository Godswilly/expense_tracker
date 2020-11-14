class AddExpenseIdToExpenseGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :expense_groups, :expense_id, :integer
  end
end
