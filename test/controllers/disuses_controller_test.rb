require 'test_helper'

class DisusesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get disuses_index_url
    assert_response :success
  end

  test "should get show" do
    get disuses_show_url
    assert_response :success
  end

  test "should get new" do
    get disuses_new_url
    assert_response :success
  end

  test "should get edit" do
    get disuses_edit_url
    assert_response :success
  end

end
