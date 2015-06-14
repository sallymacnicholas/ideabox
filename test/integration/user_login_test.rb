require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  test 'registered user can login' do
    user = User.create(username: 'sally',
                       password: 'password')

    visit login_path
    fill_in 'Username', with: 'sally'
    fill_in 'Password', with: 'password'
    click_button 'Login'

    assert page.has_content?('Welcome, sally')
    reset_session!
  end

end
