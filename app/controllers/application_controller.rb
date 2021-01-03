class ApplicationController < ActionController::Base
  before_action :authenticate_user! 
  layout :layout_by_resource 

  helper_method :current_account 

  rescue_from CanCan::AccessDenied do |exception| 
   redirect_to root_url, :error => exception.message 
end 

add_flash_types :error

  
  def current_account
     @current_account ||= current_user.account 
     @current_account 
  end 

 protected 
  def layout_by_resource 
    if devise_controller? 
      "devise" 
   else 
      "application" 
   end 
 end 
end
 

