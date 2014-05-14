Rails.application.routes.draw do
   root 'index#index'
   get 'contact' => 'index#contact'
   get 'post_score' => 'high_score#post_score'
   get 'show_score' => 'high_score#show_score'
end
