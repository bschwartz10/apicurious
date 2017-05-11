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
    scenario 'The user clicks a link to who their following and the info is displayed' do
      VCR.use_cassette("following") do
        visit root_path
        click_link 'Sign In With Github'

        click_on('following')
        expect(current_path).to eq(following_path)
        expect(page).to have_content('jk1dd')
      end
    end
    scenario 'The user clicks a link to see their recent commits' do
      VCR.use_cassette("recent commits") do
        visit root_path
        click_link 'Sign In With Github'

        click_on('See Recent Commits')
        expect(current_path).to eq(commits_path)
        expect(page).to have_content("sha: 3ab71cf9248bd858195cf2236cc152d6403b9db3")
        expect(page).to have_content("bschwartz92@gmail.com")
      end
    end
    scenario 'The user clicks a link to see their repos' do
      VCR.use_cassette("repos") do
        visit root_path
        click_link 'Sign In With Github'

        click_on('List of Repos')
        expect(current_path).to eq(repos_path)
        expect(page).to have_content("apicurious")
        expect(page).to have_content("bike-share")
      end
    end
  end
end
