require 'test_helper'

class ModerationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get moderations_index_url
    assert_response :success
  end

  test "should get create" do
    get moderations_create_url
    assert_response :success
  end

  test "should get destroy" do
    get moderations_destroy_url
    assert_response :success
  end

end
