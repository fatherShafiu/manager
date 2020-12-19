class ApplicationController < ActionController::Base
  before_action :authenticate_user! 
  layout :layout_by_resource 
 protected 
  def layout_by_resource 
    if devise_controller? 
      "devise" 
   else 
      "application" 
   end 
 end 
end
 

