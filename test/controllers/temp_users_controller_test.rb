require 'test_helper'

class TempUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @temp_user = temp_users(:one)
  end

  test "should get index" do
    get temp_users_url, as: :json
    assert_response :success
  end

  test "should create temp_user" do
    assert_difference('TempUser.count') do
      post temp_users_url, params: { temp_user: { address: @temp_user.address, alternate_contact_no: @temp_user.alternate_contact_no, approval_status: @temp_user.approval_status, approved_at: @temp_user.approved_at, approved_by: @temp_user.approved_by, awards_n_achievements: @temp_user.awards_n_achievements, city_id: @temp_user.city_id, country_id: @temp_user.country_id, default_language: @temp_user.default_language, detailed_experience: @temp_user.detailed_experience, dob: @temp_user.dob, doctor_category_id: @temp_user.doctor_category_id, is_qualified_mso: @temp_user.is_qualified_mso, medical_registration_no: @temp_user.medical_registration_no, mobile: @temp_user.mobile, password_digest: @temp_user.password_digest, pincode: @temp_user.pincode, registration_state: @temp_user.registration_state, registration_year: @temp_user.registration_year, remark: @temp_user.remark, role: @temp_user.role, state_id: @temp_user.state_id, summary: @temp_user.summary, user_id: @temp_user.user_id, work_experience: @temp_user.work_experience } }, as: :json
    end

    assert_response 201
  end

  test "should show temp_user" do
    get temp_user_url(@temp_user), as: :json
    assert_response :success
  end

  test "should update temp_user" do
    patch temp_user_url(@temp_user), params: { temp_user: { address: @temp_user.address, alternate_contact_no: @temp_user.alternate_contact_no, approval_status: @temp_user.approval_status, approved_at: @temp_user.approved_at, approved_by: @temp_user.approved_by, awards_n_achievements: @temp_user.awards_n_achievements, city_id: @temp_user.city_id, country_id: @temp_user.country_id, default_language: @temp_user.default_language, detailed_experience: @temp_user.detailed_experience, dob: @temp_user.dob, doctor_category_id: @temp_user.doctor_category_id, is_qualified_mso: @temp_user.is_qualified_mso, medical_registration_no: @temp_user.medical_registration_no, mobile: @temp_user.mobile, password_digest: @temp_user.password_digest, pincode: @temp_user.pincode, registration_state: @temp_user.registration_state, registration_year: @temp_user.registration_year, remark: @temp_user.remark, role: @temp_user.role, state_id: @temp_user.state_id, summary: @temp_user.summary, user_id: @temp_user.user_id, work_experience: @temp_user.work_experience } }, as: :json
    assert_response 200
  end

  test "should destroy temp_user" do
    assert_difference('TempUser.count', -1) do
      delete temp_user_url(@temp_user), as: :json
    end

    assert_response 204
  end
end
