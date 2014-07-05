Rails.application.routes.draw do
   root 'index#index'
   get 'contact' => 'index#contact'
   get 'about' => 'index#about'
   get 'waddlewar' => 'index#waddlewar'
   get 'superfrogjump' => 'index#superfrogjump'
   get 'post_score' => 'high_score#post_score'
   get 'show_score' => 'high_score#show_score'
   get 'ww_leaderboard' => 'high_score#ww_leaderboard'
   get 'sfj_leaderboard' => 'high_score#fg_leaderboard'
end
