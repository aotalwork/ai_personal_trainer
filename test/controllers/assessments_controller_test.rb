require "test_helper"

class AssessmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get assessments_index_url
    assert_response :success
  end

  test "should get new" do
    get assessments_new_url
    assert_response :success
  end

  test "should get create" do
    get assessments_create_url
    assert_response :success
  end
end
