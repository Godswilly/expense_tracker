require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:expense_groups) }
    it { should have_many(:groups).through(:expense_groups) }
  end
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(3) }
    it do
      should validate_numericality_of(:amount)
        .is_greater_than(0)
    end
    it { should validate_numericality_of(:amount).allow_nil }
  end
end
