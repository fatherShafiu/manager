class UsersController < ApplicationController 
   before_action :set_user, only: [:show, :edit, :update, :destroy] 
   before_action :set_users, only: [:index] 
   load_and_authorize_resource
   
   def index 
   end 
   
   def new 
    @user = User.new 
    set_choices 
   end 
   
   def edit 
    set_choices 
   end 
  
   def me 
    @user = current_user 
   end 
   
   def password 
    @user = current_user 
   end 
   
   def update_password 
    @user = current_user 
    respond_to do |format|
    if 
      @user.update(user_password_params) 
      bypass_sign_in(@user) 
      format.html { 
        redirect_to my_password_path, 
         notice: 'Password was successfully updated.'  } 
     else 
      format.html { render :password } 
    end 
  end 
 end 
 
 def update_me 
  @user = current_user 
  respond_to do |format| 
    if @user.update(user_params) 
      format.html { 
        redirect_to my_settings_path, notice: 'Your information was successfully updated.'  } 
    else 
      format.html { render :me } 
    end 
  end 
end 

def create 
  @user = User.unscoped.new(user_params.except("role")) 
   @user.account = current_account 
   @user.password = "password123" 
   respond_to do |format| 
    begin 
      if @user.valid? && @user.invite!(current_user) 
         @user.add_role user_params[:role].to_sym, current_account 
         format.html {
           redirect_to account_users_path, 
           notice: 'User was successfully invited.' 
            } 
      else 
        set_choices 
        format.html { render :new } 
      end
    rescue ActiveRecord::RecordNotUnique 
      flash[:alert]= 'Email must be unique' 
      format.html { render :new}
    end 
  end 
end 

def update 
  respond_to do |format| 
    if @user.update(user_params.except('role')) 
      format.html { 
         redirect_to account_users_path, 
         notice: 'User was successfully updated.' 
         } 
    else 
      set_choices 
      format.html { render :edit } 
    end 
  end 
end 

def destroy 
  @user.destroy 
  respond_to do |format| 
    format.html { 
      redirect_to account_users_path, 
      notice: 'User was successfully destroyed.' 
       } 
    format.json { head :no_content } 
  end 
end 
private 
# Use callbacks to share common setup or constraints between actions. 
def set_users 
  @users = current_account.users 
end 

def set_user 
  @user = User.find(params[:id]) 
end

def set_choices 
  @choices = [["Admin", 'admin'],["User", 'user']] 
end 

def user_params 
  params.require(:user).permit(:name, :email, :role, :time_zone) 
end 

def user_password_params 
  params.require(:user).permit(:password, :password_confirmation) 
end

end 