require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  describe 'Creating New groups and expenses' do
    User.create(name: 'kalu')
  end
  scenario 'user opens Create New Group page' do
    visit '/login'
    fill_in 'Name', with: 'kalu'
    click_button 'Log in'
    click_link 'My Groups'
    click_link 'CREATE A NEW GROUP'
    expect(page).to have_current_path('/groups/new')
    expect(page).to have_content 'Create Transactions Group'
    click_button 'CREATE GROUP'
    expect(page).to_not have_current_path('/login')
    expect(page).to have_current_path('/groups')
  end

  scenario 'user opens Create New Expense page' do
    visit '/login'
    fill_in 'Name', with: 'kalu'
    click_button 'Log in'
    click_link 'My Expenses'
    click_link 'ADD NEW EXPENSE'
    expect(page).to have_current_path('/expenses/new')
    expect(page).to have_content 'Create An Expense'
    click_button 'Add new expense'
    expect(page).to have_current_path('/expenses')
    expect(page).to_not have_current_path('/login')
  end
end
