require 'test_helper'

class VisitDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @visit_detail = visit_details(:one)
  end

  test "should get index" do
    get visit_details_url, as: :json
    assert_response :success
  end

  test "should create visit_detail" do
    assert_difference('VisitDetail.count') do
      post visit_details_url, params: { visit_detail: { chief_complaint: @visit_detail.chief_complaint, visit_id: @visit_detail.visit_id } }, as: :json
    end

    assert_response 201
  end

  test "should show visit_detail" do
    get visit_detail_url(@visit_detail), as: :json
    assert_response :success
  end

  test "should update visit_detail" do
    patch visit_detail_url(@visit_detail), params: { visit_detail: { chief_complaint: @visit_detail.chief_complaint, visit_id: @visit_detail.visit_id } }, as: :json
    assert_response 200
  end

  test "should destroy visit_detail" do
    assert_difference('VisitDetail.count', -1) do
      delete visit_detail_url(@visit_detail), as: :json
    end

    assert_response 204
  end
end
