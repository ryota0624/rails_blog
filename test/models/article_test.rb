require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  test "body length should be >= 10" do
    article = Article.new(body: "")
    assert_not article.save
    assert_not_empty article.errors
  end
end
