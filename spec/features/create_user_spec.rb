require 'rails_helper'

RSpec.describe User, type: :feature do

  it 'can create a new user' do
    visit new_user_path
    page.fill_in 'Username', with: 'sally'
    page.fill_in 'Password', with: 'password'
    page.click_button 'Create Account'
    expect(page).to have_content('Welcome, sally')
  end

  it 'does not create a new account with missing information' do
    visit new_user_path
    page.fill_in 'Username', with: ''
    page.fill_in 'Password', with: 'password'
    page.click_button 'Create Account'
    save_and_open_page

    expect(page).to have_content('Invalid Login')

  end

end
