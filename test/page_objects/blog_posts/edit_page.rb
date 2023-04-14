module BlogPosts
  class EditPage < AePageObjects::Document
    path :edit_blog_post

    element :submit_button, locator: '.js-submit'

    form_for :blog_post do
      element :title
      element :body
    end

    def update!
      submit_button.node.click
      stale!
      window.change_to(ShowPage)
    end
  end
end
