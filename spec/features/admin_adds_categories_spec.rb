require 'rails_helper'

RSpec.describe User, type: :feature do
  xit 'can see the category index logged in as an admin' do
    admin = User.create(username: 'admin',
                        password: 'password',
                        role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit admin_categories_path
    expect(page).to have_content?('All Categories')
  end
end
