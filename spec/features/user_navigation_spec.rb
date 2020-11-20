require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  describe 'Navigation through the application pages' do
    User.create(name: 'kalu')
    Group.create(name: 'Cars', author_id: 1)
    Expense.create(name: 'Lexus', amount: 2_000_000, author_id: 1)
    Expense.create(name: 'Corolla', amount: 1_000_000, author_id: 1)
    ExpenseGroup.create(expense_id: 1, group_id: 1)
  end

  scenario 'user is presented with a profile page' do
    visit '/login'
    fill_in 'Name', with: 'kalu'
    click_button 'Log in'
    expect(page).to have_content 'My Groups'
    expect(page).to have_content 'My Expenses'
    expect(page).to have_content 'My External expenses'
    expect(page).to_not have_content 'log In'
    expect(page).to_not have_content 'Sign Up'
  end
end
