module BlogPosts
  class IndexPage < AePageObjects::Document
    path :blog_posts

    element :title, locator: '.js-title'
  end
end
