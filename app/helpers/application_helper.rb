module ApplicationHelper 
  def bootstrap_class_for flash_type  
    { 
         success: "alert-success", 
         error: "alert-danger", 
         alert: "alert-warning", 
         notice: "alert-info" 
          }[flash_type.to_sym] || flash_type.to_s 
        end 
        
def flash_messages(_opts = {}) 
# return if flash[0][0] == :form_error 
  flash.each do |msg_type, message| 
        next if msg_type == :form_error 
        concat(content_tag(:div, message.html_safe, { 
        class: "alert #{bootstrap_class_for(msg_type)} fade show"}) do 
        concat content_tag(:button, 'x', class: "close", data: { 
        dismiss: 'alert' 
        }) 
        concat message.html_safe 
        end) 
        end 
  nil 
end 
end
