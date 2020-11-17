# frozen_string_literal: true

class AddExpenseToExpenseGroups < ActiveRecord::Migration[6.0]
  def change
    add_reference :expense_groups, :expense, null: false, foreign_key: true
  end
end
