require 'rails_helper'

RSpec.describe User, type: :feature do
  xit 'can create an idea' do
    user = User.create(username: 'sally', password: 'password')
    visit login_path
    page.fill_in 'Username', with: 'sally'
    page.fill_in 'Password', with: 'password'
    page.click_button 'Login'
    save_and_open_page
    click_link 'Create New Idea'
    save_and_open_page
    page.fill_in 'Idea', with: 'save the world'
    page.fill_in 'Description', with: 'make robots that do everything'
    click_button 'add idea'

    expect(page).to have_content('save the world')


  end
end
