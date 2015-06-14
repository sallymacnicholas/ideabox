require 'rails_helper'

RSpec.describe User, type: :feature do

  it 'can login' do
    User.create(username: 'sally', password: 'password')
    visit login_path
    page.fill_in 'Username', with: 'sally'
    page.fill_in 'Password', with: 'password'
    page.click_button 'Login'

    expect(page).to have_content('Welcome, sally')
    reset_session!
  end

end
