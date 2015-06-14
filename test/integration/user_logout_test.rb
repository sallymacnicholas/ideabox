require 'test_helper'

class UserLogoutTest < ActionDispatch::IntegrationTest
  test "logged in user can log out" do
    user = User.create(username: 'sally',
                       password: 'password')

    visit login_path
    fill_in 'Username', with: 'sally'
    fill_in 'Password', with: 'password'
    click_button 'Login'

    assert page.has_content?('Welcome, sally')

    click_link 'Logout'

    refute page.has_content?('Welcome, sally')

  end
end
