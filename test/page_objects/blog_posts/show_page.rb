module BlogPosts
  class ShowPage < AePageObjects::Document
    path :blog_post

    element :title, locator: '.js-title'
    element :body, locator: '.js-body'
  end
end
