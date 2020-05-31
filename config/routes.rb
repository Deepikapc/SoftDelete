Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 resources :posts
 get '/list_trashed_post' => 'posts#trash_list', :as => 'get_trash_post'

 get '/list_restored_post' => 'posts#restore_list', :as => 'get_restore_post'

 get '/index_reload' => 'posts#index_reload'
 resources :comments
  post "/comments" => "comments#create"
 root to: "posts#index"
end
