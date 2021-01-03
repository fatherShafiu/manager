module SystemMacros 
    def login_user 
        before(:each) do 
            @user = FactoryBot.create(:user) 
            @user.add_role :user 
            login_as(@user, :scope => :user) 
        end 
    end 
    
    def login_admin 
        before(:each) do 
            @admin = FactoryBot.create(:user) 
            @admin.add_role :admin 
            login_as(@admin, :scope => :user) 
        end 
    end

end
