SeleniumTestDemoApp::Application.routes.draw do
  resources :blog_posts
  root to: 'blog_posts#index'
end
