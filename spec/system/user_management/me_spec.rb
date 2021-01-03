require 'rails_helper' 

RSpec.describe 'My Settings', type: :system do 
    login_user 
    it 'should be able to visit my_settings' do 
        visit my_settings_path 
        expect(page).to have_current_path(my_settings_path) 
    end 
    it 'should edit my settings successfully' do 
        visit my_settings_path 
        within '#edit_my_user' do 
            fill_in 'user_name', with: 'Test' 
            fill_in 'user_email', with: 'test@test.com' 
        end 
        click_button('Update My Settings') 
        expect(page).to have_current_path(my_settings_path)
    end 23 24 it 'and fail to edit my settings successfully' do 
        visit my_settings_path 
        within '#edit_my_user' do 
            fill_in 'user_name', with: 'Test' 
            fill_in 'user_email', with: '' 
        end 
        click_button('Update My Settings') 
        expect(page).to have_current_path(update_my_settings_path) 
        expect(page).to have_content('error') 
    end 
end 
