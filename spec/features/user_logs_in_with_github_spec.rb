require 'rails_helper'

RSpec.feature 'User can log in with GitHub' do
  context 'An existing user has valid credentials' do
    before do
      Capybara.app = Apicurious::Application
      stub_oauth
    end

    def stub_oauth
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
        uid: '1234',
        info: {name: 'Brett Schwartz'},
        credentials: {token: 'qwerty'},
      })
    end

    scenario 'The user clicks login on root path' do
      visit root_path

      expect(page.status_code).to eq 200
      click_link 'Sign In With Github'
      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content('Brett Schwartz')
      expect(page).to have_link('Logout')
    end
  end
end
