require 'rails_helper' 
 RSpec.describe ActivityController, type: :controller do 
    login_user 
     describe "GET #mine" do 
         it "returns http success" do 
         get :mine 
        expect(response).to have_http_status(:success) 
    end 
end

 describe "GET #feed" do 
    it "returns http success" do 
     get :feed 
     expect(response).to have_http_status(:success) 
     end  
    end 

 describe "POST #create" do 
    it "creates an account" do 
        post :create, params: { account: FactoryBot.attributes_for(:account)} 
        expect(response).to redirect_to root_path
 end 
  it "renders :new on failure" do 
    post :create, params: {account: FactoryBot.attributes_for(:account,{ 
         name: nil 
          })} 
           expect(response).to render_template :new 
         end 
        end 
     end


    

