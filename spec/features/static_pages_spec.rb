require 'rails_helper'

RSpec.feature "Homes", type: :feature do

  scenario "homeへページ遷移できるか" do
    visit root_path
    click_link "Home"

    expect(page).to have_content("Welcome to the Sample App")
  end

  scenario "aboutへページ遷移できるか" do
    visit root_path
    click_link "About"

    expect(page).to have_content("Help Log in About")
  end

  scenario "helpへページ遷移できるか" do
    visit root_path
    click_link "Help"

    expect(page).to have_content("Log in Help")
  end
end
