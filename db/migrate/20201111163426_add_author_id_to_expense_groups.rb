# frozen_string_literal: true

class AddAuthorIdToExpenseGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :expense_groups, :author_id, :string
  end
end
