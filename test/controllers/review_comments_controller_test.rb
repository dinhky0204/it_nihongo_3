require 'test_helper'

class ReviewCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @review_comment = review_comments(:one)
  end

  test "should get index" do
    get review_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_review_comment_url
    assert_response :success
  end

  test "should create review_comment" do
    assert_difference('ReviewComment.count') do
      post review_comments_url, params: { review_comment: { content: @review_comment.content, review_id: @review_comment.review_id, user_id: @review_comment.user_id } }
    end

    assert_redirected_to review_comment_url(ReviewComment.last)
  end

  test "should show review_comment" do
    get review_comment_url(@review_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_review_comment_url(@review_comment)
    assert_response :success
  end

  test "should update review_comment" do
    patch review_comment_url(@review_comment), params: { review_comment: { content: @review_comment.content, review_id: @review_comment.review_id, user_id: @review_comment.user_id } }
    assert_redirected_to review_comment_url(@review_comment)
  end

  test "should destroy review_comment" do
    assert_difference('ReviewComment.count', -1) do
      delete review_comment_url(@review_comment)
    end

    assert_redirected_to review_comments_url
  end
end
