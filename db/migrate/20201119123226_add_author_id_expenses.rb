class AddAuthorIdExpenses < ActiveRecord::Migration[6.0]
  def change
    add_reference :expenses, :author, foreign_key: { to_table: :users }
  end
end
