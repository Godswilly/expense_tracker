# frozen_string_literal: true

class ExpenseGroup < ApplicationRecord
  belongs_to :expense
  belongs_to :group
end
