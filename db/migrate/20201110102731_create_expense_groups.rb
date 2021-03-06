# frozen_string_literal: true

class CreateExpenseGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :expense_groups do |t|
      t.references :user, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
