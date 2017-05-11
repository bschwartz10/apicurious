require 'rails_helper'

RSpec.feature 'User can log in with GitHub' do
  context 'An existing user has valid credentials' do
    before do
      Capybara.app = Apicurious::Application
      stub_oauth
    end

    scenario 'The user clicks login on root path' do
      VCR.use_cassette("log in") do
        visit root_path

        expect(page.status_code).to eq 200
        click_link 'Sign In With Github'
        expect(current_path).to eq(dashboard_path)
        expect(page).to have_content('Brett Schwartz')
        expect(page).to have_link('Logout')
      end
    end

    scenario 'The user sees their username on the dashboard page' do
      VCR.use_cassette("username") do
        visit root_path
        click_link 'Sign In With Github'

        expect(page).to have_content('bschwartz10')
      end
    end

    scenario 'The user sees their avatar on the dashboard page' do
      VCR.use_cassette("image") do
        visit root_path
        click_link 'Sign In With Github'

        expect(page).to have_css('.image')
      end
    end

    scenario 'The user sees the number of starred repos on the dashboard page' do
      VCR.use_cassette("starred") do
        visit root_path
        click_link 'Sign In With Github'

        expect(page).to have_content('You have 1 starred repo')
      end
    end

    scenario 'The user clicks a link to their followers and their followers info is displayed' do
      VCR.use_cassette("followers") do
        visit root_path
        click_link 'Sign In With Github'

        click_on('followers')
        expect(current_path).to eq(followers_path)
        expect(page).to have_content('jk1dd')
      end
    end
  end
end
