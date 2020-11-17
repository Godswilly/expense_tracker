# frozen_string_literal: true

class RemoveAuthorIdFromGroups < ActiveRecord::Migration[6.0]
  def change
    remove_column :groups, :author_id, :integer
  end
end
