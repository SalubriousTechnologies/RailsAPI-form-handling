require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url, as: :json
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { address: @user.address, alternate_contact_no: @user.alternate_contact_no, approved_by: @user.approved_by, auth_token: @user.auth_token, auth_token_expiry: @user.auth_token_expiry, awards_n_achievements: @user.awards_n_achievements, city_id: @user.city_id, confirmation_sent_at: @user.confirmation_sent_at, confirmation_token: @user.confirmation_token, confirmed_at: @user.confirmed_at, country_id: @user.country_id, created_by: @user.created_by, default_language: @user.default_language, designation: @user.designation, detailed_experience: @user.detailed_experience, dob: @user.dob, doctor_category_id: @user.doctor_category_id, email: @user.email, fee: @user.fee, gender: @user.gender, is_approved: @user.is_approved, is_editable: @user.is_editable, is_email_confirmed: @user.is_email_confirmed, is_internal_doctor: @user.is_internal_doctor, is_qualified_mso: @user.is_qualified_mso, is_tnc_accepted: @user.is_tnc_accepted, is_verified: @user.is_verified, medical_registration_no: @user.medical_registration_no, mobile: @user.mobile, name: @user.name, password_digest: @user.password_digest, pincode: @user.pincode, profile_photo: @user.profile_photo, registration_state: @user.registration_state, registration_year: @user.registration_year, reset_password_sent_at: @user.reset_password_sent_at, reset_password_token: @user.reset_password_token, role: @user.role, state_id: @user.state_id, status: @user.status, store_code: @user.store_code, summary: @user.summary, username: @user.username, work_experience: @user.work_experience, zoom_id: @user.zoom_id } }, as: :json
    end

    assert_response 201
  end

  test "should show user" do
    get user_url(@user), as: :json
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { address: @user.address, alternate_contact_no: @user.alternate_contact_no, approved_by: @user.approved_by, auth_token: @user.auth_token, auth_token_expiry: @user.auth_token_expiry, awards_n_achievements: @user.awards_n_achievements, city_id: @user.city_id, confirmation_sent_at: @user.confirmation_sent_at, confirmation_token: @user.confirmation_token, confirmed_at: @user.confirmed_at, country_id: @user.country_id, created_by: @user.created_by, default_language: @user.default_language, designation: @user.designation, detailed_experience: @user.detailed_experience, dob: @user.dob, doctor_category_id: @user.doctor_category_id, email: @user.email, fee: @user.fee, gender: @user.gender, is_approved: @user.is_approved, is_editable: @user.is_editable, is_email_confirmed: @user.is_email_confirmed, is_internal_doctor: @user.is_internal_doctor, is_qualified_mso: @user.is_qualified_mso, is_tnc_accepted: @user.is_tnc_accepted, is_verified: @user.is_verified, medical_registration_no: @user.medical_registration_no, mobile: @user.mobile, name: @user.name, password_digest: @user.password_digest, pincode: @user.pincode, profile_photo: @user.profile_photo, registration_state: @user.registration_state, registration_year: @user.registration_year, reset_password_sent_at: @user.reset_password_sent_at, reset_password_token: @user.reset_password_token, role: @user.role, state_id: @user.state_id, status: @user.status, store_code: @user.store_code, summary: @user.summary, username: @user.username, work_experience: @user.work_experience, zoom_id: @user.zoom_id } }, as: :json
    assert_response 200
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user), as: :json
    end

    assert_response 204
  end
end
