require 'rails_helper'

RSpec.describe User, type: :feature do
  it 'can update an idea' do
    user = User.create(username: 'sally', password: 'password')

    visit login_path
    page.fill_in 'Username', with: 'sally'
    page.fill_in 'Password', with: 'password'
    page.click_button 'Login'

    click_link 'Create New Idea'
    page.fill_in 'Name', with: 'save the world'
    page.fill_in 'Description', with: 'make robots that do everything'
    click_button 'Create Idea'

    click_link 'Create New Idea'
    page.fill_in 'Name', with: 'a new description'
    page.fill_in 'Description', with: 'just a bunch of nothing'
    click_button 'Create Idea'

    first(:link, 'Edit').click
    page.fill_in 'Name', with: 'no longer saving the planet'
    page.fill_in 'Description', with: 'sure ok'
    click_button 'Update Idea'

    save_and_open_page

    expect(page).to_not have_content('save the world')
    expect(page).to have_content('no longer saving the planet')
  end
end
