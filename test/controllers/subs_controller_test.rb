# == Schema Information
#
# Table name: subs
#
#  id           :bigint(8)        not null, primary key
#  title        :string           not null
#  description  :string           not null
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class SubsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get subs_new_url
    assert_response :success
  end

  test "should get edit" do
    get subs_edit_url
    assert_response :success
  end

  test "should get create" do
    get subs_create_url
    assert_response :success
  end

  test "should get update" do
    get subs_update_url
    assert_response :success
  end

  test "should get show" do
    get subs_show_url
    assert_response :success
  end

  test "should get index" do
    get subs_index_url
    assert_response :success
  end

  test "should get destroy" do
    get subs_destroy_url
    assert_response :success
  end

end
