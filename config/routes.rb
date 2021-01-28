Rails.application.routes.draw do

  root to: 'home#top'
  get 'about' => 'home#about'
  get '/' => "home#top"

  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
