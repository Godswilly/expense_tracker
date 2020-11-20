require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  describe 'Accessing Application' do
    User.create(name: 'kalu')
    Group.create(name: 'Cars', author_id: 1)
    Expense.create(name: 'Lexus', amount: 2_000_000, author_id: 1)
    Expense.create(name: 'Corolla', amount: 1_000_000, author_id: 1)
    ExpenseGroup.create(expense_id: 1, group_id: 1)
  end

  scenario 'Signing in with correct credentials' do
    visit '/login'
    fill_in 'Name', with: 'kalu'
    click_button 'Log in'
    expect(page).to have_content 'Successfully logged in.'
    expect(page).to have_current_path(root_path)
    expect(page).to_not have_current_path('/login')
  end

  scenario "User can't Sign in with wrong credentials" do
    visit '/login'
    fill_in 'Name', with: 'kalusha'
    click_button 'Log in'
    expect(page).to have_content 'Error logging in.'
    expect(page).to have_current_path('/login')
    expect(page).to_not have_current_path(root_path)
  end
end
