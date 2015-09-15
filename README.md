# SeleniumTestDemoApp

This is a small scaffoled Rails app. It's helpful for learning to use
[AePageObjects](http://github.com/appfolio/ae_page_objects).

## Setup

```sh
git clone https://github.com/appfolio/selenium_test_demo_app
cd selenium_test_demo_app
bundle
```

## Test

Your goal is to get the test at `test/selenium/blog_posts_test.rb` to pass. You
can do this by running

```sh
rake
```

Fix the test failures one at a time by editing the page objects located in
`test/page_objects/blog_posts` and the templates in `app/views` (if necessary).

You want to focus on the first test failure. Let's say that first failure looks
like this:

```
  1) Error:
BlogPostTest#test_blog_posts_appear_on_index_page:
NoMethodError: undefined method `blog_posts' for #<BlogPosts::IndexPage:0x007fe4f13b4bf0>
    test/selenium/blog_post_test.rb:26:in `test_blog_posts_appear_on_index_page'
```

Now you can focus on just that test. Try running it by itself thusly:

```sh
ruby -Itest test/selenium/blog_post_test.rb --name=test_blog_posts_appear_on_index_page
```

Once you've fixed that first error, repeat the failure -> success cycle until
`rake` comes back clean like this:

```
selenium_test_demo_app$ rake
Run options: --seed 36997

# Running tests:

...

Finished tests in 2.468421s, 1.2154 tests/s, 2.8358 assertions/s.

3 tests, 7 assertions, 0 failures, 0 errors, 0 skips
```

* Copyright AppFolio
* Licensed under the MIT license