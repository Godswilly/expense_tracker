class RemoveUserIdFromExpenses < ActiveRecord::Migration[6.0]
  def change
    remove_column :expenses, :user_id, :integer
  end
end
