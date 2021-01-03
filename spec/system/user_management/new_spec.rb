require 'rails_helper' 

RSpec.describe "New User", type: :system do 
    login_admin 
    it "should be able to visit the user index and see at least one user" do 
        visit account_users_path 
        expect(current_path).to eql(account_users_path) 
        expect(page).to have_content("#{@admin.name}") 
    end 
    context "a regular user" do 
        login_user 
        it "should redirect with only user access" do
    visit account_users_path 
    expect(current_path).to eql(root_path) 
end
end 

context "click and new the user" do 
    it "should click new and go to new page" do 
        visit account_users_path 
        click_on("Add User") 
        expect(current_path).to eql(new_account_user_path) 
    end 
    
    context "and on the new page" do 
        it "and new the user successfully" do 
            visit account_users_path 
            click_on("Add User") 
            within "#new_user" do 
                fill_in "user_name", with: 'Test' 
                fill_in "user_email", with: 'test@test.com' 
                select('User', :from => 'user_role') 
            end 
            click_button("Add User") 
            expect(current_path).to eql(account_users_path) 
        end 
        
        it "and fail to new the user successfully" do 
            visit account_users_path 50 click_on("Add User") 
            within "#new_user" do 
                fill_in "user_name", with: 'Test' 
                fill_in "user_email", with: '' 
                select('User', :from => 'user_role') 
            end 
            click_button("Add User") 
            expect(current_path).to eql(account_users_path) 
        end 
    end
end 
end