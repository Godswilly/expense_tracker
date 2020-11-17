# frozen_string_literal: true

class RemoveAuthorIdFromExpenses < ActiveRecord::Migration[6.0]
  def change
    remove_column :expenses, :author_id, :integer
  end
end
