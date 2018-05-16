# == Schema Information
#
# Table name: comments
#
#  id                :bigint(8)        not null, primary key
#  content           :string           not null
#  author_id         :integer          not null
#  post_id           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  parent_comment_id :integer
#

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get comments_new_url
    assert_response :success
  end

  test "should get create" do
    get comments_create_url
    assert_response :success
  end

end
