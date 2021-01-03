class RegistrationsController < Devise::RegistrationsController 
    before_action :configure_permitted_parameters 
 protected 
  def configure_permitted_parameters 
     devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) 
    end 
  def after_sign_up_path_for(resource) 
     new_accounts_path 
  end 
end
