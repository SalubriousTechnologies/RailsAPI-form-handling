class TempUsersController < ApplicationController
  before_action :set_temp_user, only: [:show, :update, :destroy, :approve_user_profile]

  # GET /temp_users
  def index
    @temp_users = TempUser.all

    render json: @temp_users
  end

  # GET /temp_users/1
  def show
    render json: @temp_user
  end

  # POST /temp_users
  def create
    @temp_user = TempUser.new(temp_user_params)
    @temp_user.approval_status = 0

    if @temp_user.save
      render json: @temp_user, status: :created, location: @temp_user
    else
      render json: @temp_user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /temp_users/1
  def update
    if @temp_user.update(temp_user_params)
      render json: @temp_user
    else
      render json: @temp_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /temp_users/1
  def destroy
    @temp_user.destroy
  end

  def approve_user_profile
    user = User.find(@temp_user.user_id)
    user.profile_photo.attach(@temp_user.profile_photo.blob)
    user.save!(validate: false)
    render json: UserSerializer.new(user).serialized_json
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_temp_user
      @temp_user = TempUser.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def temp_user_params
      params.require(:temp_user).permit(:user_id, :password, :password_confirmation, :mobile, :alternate_contact_no, :dob, :address, :city_id, :state_id, :country_id, :pincode, :default_language, :doctor_category_id, :role, :medical_registration_no, :registration_state, :registration_year, :work_experience, :detailed_experience, :awards_n_achievements, :summary, :is_qualified_mso, :profile_photo)
    end
end
