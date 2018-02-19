module BlogPosts
  class NewPage < AePageObjects::Document
    path :new_blog_post

    element :submit_button, locator: '.js-submit'

    form_for :blog_post do
      element :title
      element :body
    end

    def submit!
      submit_button.node.click
      stale!
      window.change_to(ShowPage)
    end
  end
end
