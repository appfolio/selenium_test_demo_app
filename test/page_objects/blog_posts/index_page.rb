module BlogPosts
  class IndexPage < AePageObjects::Document
    path :blog_posts

    element :title, locator: '.js-title'

    collection :blog_posts, locator: 'tbody', item_locator: 'tr' do
      element :title, locator: '.js-blog-title'
      element :body, locator: '.js-blog-body'
      element :edit_button, locator: '.js-edit'
      element :delete_button, locator: '.js-delete'

      def edit!
        edit_button.node.click
        window.change_to(EditPage)
      end

      def delete!
        delete_button.node.click
        alert = node.base.driver.browser.switch_to.alert
        yield alert if block_given?
        alert.accept
        window.change_to(IndexPage)
      end
    end
  end
end
