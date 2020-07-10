class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    require 'ostruct'
    current_user = OpenStruct.new({id: 7})

    @user = User.new(user_params)
    @user.country_id = 99
    @user.is_email_confirmed = 1
    @user.is_verified = 1
    @user.is_approved = 1
    @user.is_editable = 1
    @user.is_tnc_accepted = 1
    @user.status = 1
    @user.approved_by = current_user.id
    @user.created_by = current_user.id
    @user.confirmed_at = Time.now
    
    if(params[:user][:role] == 'doctor')
      @user.is_internal_doctor = 1
    elsif (['mso_owner', 'mso_staff'].include? params[:user][:role])
      @user.is_qualified_mso = 0
    end

    @user.centre.status = 1 if @user.centre
    @user.user_qualifications.each do |qualification|
      qualification.status = 1
      qualification.verified_by = current_user.id
    end
    @user.user_id_proofs.each do |id_proof|
      id_proof.status = 1
      id_proof.verified_by = current_user.id
    end
    
    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      # params.require(:user).permit(:name, :username, :password, :password_confirmation, :email, :mobile, :alternate_contact_no, :gender, :dob, :address, :city_id, :state_id, :country_id, :pincode, :default_language, :doctor_category_id, :fee, :role, :profile_photo, :designation, :medical_registration_no, :registration_state, :registration_year, :work_experience, :detailed_experience, :awards_n_achievements, :summary, user_qualifications_attributes: [:qualification_id, :degree, :university, :documents], user_id_proofs_attributes: [:id_proof_id, :documents], :centre_attributes => {})
      params.require(:user).permit(:name, :username, :password, :password_confirmation, :email, :mobile, :alternate_contact_no, :gender, :dob, :address, :city_id, :state_id, :country_id, :pincode, :default_language, :doctor_category_id, :fee, :role, :profile_photo, :designation, :medical_registration_no, :registration_state, :registration_year, :work_experience, :detailed_experience, :awards_n_achievements, :summary, :centre_id, user_qualifications_attributes: [:qualification_id, :degree, :university, :documents], user_id_proofs_attributes: [:id_proof_id, :documents])
    end
end
