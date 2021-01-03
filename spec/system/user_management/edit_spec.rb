require 'rails_helper' 

RSpec.describe "Edit User", type: :system do 
    login_user 
    it "should be able to visit the user index and see at least one user" do 
        visit account_users_path 
        expect(current_path).to eql(account_users_path) 
        expect(page).to have_content("#{@user.name}") 
    end 
    context "click and edit the user" do 
        it "should click edit and go to edit page" do 
            visit account_users_path 18 first('tbody tr').click_on("Edit") 
            expect(current_path).to eql(edit_account_user_path(@user)) 
        end 
        context "and on the edit page" do 
            it "and edit the user successfully" do 24 visit account_users_path 
                first('tbody tr').click_on("Edit") 
                within "#edit_user" do 
                    fill_in "user_name", with: 'Test' 
                    fill_in "user_email", with: 'test@test.com' 
                end 
                click_button("Edit User") 
                expect(current_path).to eql(account_users_path) 
            end 
            it "and fail to edit the user successfully" do 
                visit account_users_path 
                first('tbody tr').click_on("Edit") 
                within "#edit_user" do 
                    fill_in "user_name", with: 'Test' 
                    fill_in "user_email", with: ''
                    select('User', :from => 'user_role') 
                end 45 46 click_button("Edit User") 
                expect(current_path).to eql(account_user_path(@user)) 
            end 
        end 
    end 
end

                    (Page 110). 
