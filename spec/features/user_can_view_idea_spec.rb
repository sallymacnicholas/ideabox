require 'rails_helper'

RSpec.describe User, type: :feature do
  it 'can view an idea' do
    user = User.create(username: 'sally', password: 'password')

    visit login_path
    page.fill_in 'Username', with: 'sally'
    page.fill_in 'Password', with: 'password'
    page.click_button 'Login'

    click_link 'Create New Idea'
    page.fill_in 'Name', with: 'save the world'
    page.fill_in 'Description', with: 'make robots that do everything'
    click_button 'Create Idea'

    click_link 'save the world'

    expect(page).to have_content('save the world')
    expect(page).to have_content('make robots that do everything')
  end
end
