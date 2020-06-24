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

    expect(page).to have_content("About")
  end

  scenario "helpへページ遷移できるか" do
    visit root_path
    click_link "Help"

    expect(page).to have_content("Help")
  end

  scenario "contactへページ遷移できるか" do
    visit root_path
    click_link "Contact"

    expect(page).to have_content("Contact")
  end

end
