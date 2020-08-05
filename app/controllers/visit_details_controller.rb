class VisitDetailsController < ApplicationController
  before_action :set_visit_detail, only: [:show, :update, :destroy]

  # GET /visit_details
  def index
    @visit_details = VisitDetail.all

    render json: @visit_details
  end

  # GET /visit_details/1
  def show
    render json: @visit_detail
  end

  # POST /visit_details
  def create
    @visit_detail = VisitDetail.new(visit_detail_params)

    if @visit_detail.save
      render json: @visit_detail, status: :created, location: @visit_detail
    else
      render json: @visit_detail.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /visit_details/1
  def update
    if @visit_detail.update(visit_detail_params)
      render json: @visit_detail
    else
      render json: @visit_detail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /visit_details/1
  def destroy
    @visit_detail.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visit_detail
      @visit_detail = VisitDetail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def visit_detail_params
      params.require(:visit_detail).permit(:chief_complaint, :visit_id, :complaint_details)
    end
end
