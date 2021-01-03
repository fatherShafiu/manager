require 'rails_helper' 

RSpec.describe "SignUpProcesses", type: :system do 
  before do 
    driven_by(:rack_test) 
  end 
  
  it "should require the user to sign up and successfully sign up" do 
    visit root_path
    click_on 'Sign up' 
    within "#new_user" do 
      fill_in "user_name", with: 'Test' 
      fill_in "user_email", with: 'test@test.com' 
      fill_in "user_password", with: 'password123' 
      fill_in "user_password_confirmation", with: 'password123' 
    end 
    
    click_button "Sign Up" 
    expect(current_path).to eql(new_accounts_path) 
    within "#new_account" do 
      fill_in "account_name", with: "Test Co" 
    end 
    click_button "Save" 
    expect(current_path).to eql(root_path) 
  end 
  
  it "should fail on invalid user information" do 
    visit root_path 
    click_on 'Sign up' 
    within "#new_user" do 
      fill_in "user_name", with: 'Test' 
      fill_in "user_email", with: 'test' 
      fill_in "user_password", with: 'p' 
    end 
    
    click_button "Sign Up" 
    expect(current_path).to eql('/users') 
    expect(page).to have_content("error") 
  
  end 
  it "should fail on invalid account information" do
    visit root_path
    click_on 'Sign up' 
    within "#new_user" do 
      fill_in "user_name", with: 'Test' 
      fill_in "user_email", with: 'test2@test.com' 
      fill_in "user_password", with: 'password123' 
      fill_in "user_password_confirmation", with: 'password123' 
    end 
    click_button "Sign Up" 
     within "#new_account" do 
     fill_in "account_name", with: "" 
    end 
    click_button "Save" 
    expect(current_path).to eql('/accounts') 
    expect(page).to have_content("error") 
  end

