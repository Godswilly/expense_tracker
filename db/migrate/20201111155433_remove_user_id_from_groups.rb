# frozen_string_literal: true

class RemoveUserIdFromGroups < ActiveRecord::Migration[6.0]
  def change
    remove_column :groups, :user_id, :string
  end
end
