require 'test_helper'

class BlogPostTest < ActionDispatch::IntegrationTest

  def test_index_page_has_title
    index_page = BlogPosts::IndexPage.visit
    assert_equal 'Listing blog_posts', index_page.title.text
  end

  def test_blog_posts_appear_on_index_page

    BlogPost.create!(
      title: 'title 1',
      body: 'body 1'
    )

    BlogPost.create!(
      title: 'title 2',
      body: 'body 2'
    )

    index_page = BlogPosts::IndexPage.visit

    # hint: use a collection for the blog_posts

    first_post = index_page.blog_posts.first
    assert_equal 'title 1', first_post.title.text
    assert_equal 'body 1', first_post.body.text

    last_post = index_page.blog_posts.last
    assert_equal 'title 2', last_post.title.text
    assert_equal 'body 2', last_post.body.text
  end

  def test_can_create_a_new_blog_post
    new_page = BlogPosts::NewPage.visit

    blog_post = new_page.blog_post
    blog_post.title.set 'this is the title'
    blog_post.body.set 'this is the body'
    show_page = new_page.submit!

    assert_equal 'this is the title', show_page.title.text
    assert_equal 'this is the body', show_page.body.text
  end

  # Time permitting, maybe add some tests for the show and edit actions?

end
