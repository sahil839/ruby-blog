require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "cannot save comment without commenter" do
    article = Article.new
    comment = article.comments.new
     assert_not comment.save
  end
  test "cannot save comment without body" do
    article = Article.new
    comment = article.comments.new
    assert_not comment.save
  end
end
