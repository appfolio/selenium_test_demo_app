module BlogPosts
  class IndexPage < AePageObjects::Document
    path :blog_posts

    element :title, locator: '.js-title'

    collection :blog_posts, locator: 'tbody', item_locator: 'tr' do
      element :title, locator: '.js-blog-title'
      element :body, locator: '.js-blog-body'
    end
  end
end
