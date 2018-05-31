require "rails_helper"

RSpec.feature "Test login", :type => :feature do
    scenario "Login dengan data yang salah" do
        visit "/login"
  
        fill_in "session[username]", :with => ""
        click_button "Login"
  
        expect(page).to have_text("Username / Password salah")
    end

    scenario "Mendaftar sebagai member" do
        visit register_path
        click_button "Mendaftar"
    
        expect(page).to have_text("can't be blank")
    end
end
