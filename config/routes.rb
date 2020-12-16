Rails.application.routes.draw do
  get 'activity/mine'
  get 'activity/feed'

  root to:'activity#mine'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
