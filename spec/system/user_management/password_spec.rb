require 'rails_helper' 

RSpec.describe 'Password Change', type: :system do 
    login_user 5 6 it 'should be able to visit my_password' do 
        visit my_password_path 
        expect(page).to have_current_path(my_password_path) 
    end 
    it 'should edit my password successfully' do 
        visit my_password_path 
        within '#edit_user_password' do 
            fill_in 'user_password', with: 'pass123' 
            fill_in 'user_password_confirmation', with: 'pass123' 
        end 
        click_button('Update Password') 
        expect(page).to have_current_path(my_password_path)
    end 
    it 'and fail to edit my password successfully' do 
        visit my_password_path 
        within '#edit_user_password' do 
            fill_in 'user_password', with: 'Test' 
            fill_in 'user_password_confirmation', with: '' 
        end 
        click_button('Update Password') 
        expect(page).to have_current_path(my_update_password_path) 
        expect(page).to have_content('error') 
    end 
end
