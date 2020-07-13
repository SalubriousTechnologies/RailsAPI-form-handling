class CentresController < ApplicationController
  before_action :set_centre, only: [:show, :update, :destroy]

  # GET /centres
  def index
    @centres = Centre.all

    render json: @centres
  end

  # GET /centres/1
  def show
    render json: @centre
  end

  # POST /centres
  def create
    @centre = Centre.new(centre_params)
    @centre.status = 1
    @centre.created_by = current_user.id
    
    if @centre.save
      render json: @centre, status: :created, location: @centre
    else
      render json: @centre.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /centres/1
  def update
    if @centre.update(centre_params)
      render json: @centre
    else
      render json: @centre.errors, status: :unprocessable_entity
    end
  end

  # DELETE /centres/1
  def destroy
    @centre.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_centre
      @centre = Centre.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def centre_params
      params.require(:centre).permit(:store_code, :centre_title, :centre_address, :centre_type, :fixed_payment, :revenue_share)
    end
end
