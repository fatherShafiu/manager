module ControllerMacros 
  def login_user 
    before(:each) do 
      @request.env["devise.mapping"] = Devise.mappings[:user] 
      @user = FactoryBot.create(:user) 
      @user.add_role :user, @user.account 
      sign_in @user 
    end 
  end 
  
  def login_admin 
    before(:each) do 
      @request.env["devise.mapping"] = Devise.mappings[:user] 
      @admin = FactoryBot.create(:user) 
      @admin.add_role :admin, @admin.account 
      sign_in @admin 
    end 
  end

end

    