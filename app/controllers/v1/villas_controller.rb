class V1::VillasController < ApplicationController
  before_action :set_v1_villa, only: %i[ show edit update destroy ]

  # GET /v1/villas or /v1/villas.json
  def index
    binding.pry
      order_by = (params[:sort_by].present? && params[:sort_by] == 'price') ? 'average_price desc' : 'villa_availability desc'
     
    villas = Villa.joins(:villa_schedules).where("(villa_schedules.booking_date between '#{params['villa']['from']}' and '#{params['villa']['to']}') ").
    group("villas.id").order(order_by).pluck("villas.name, SUM(Case 
    When villa_schedules.availability = true Then 0 
    Else 1 End) AS villa_availability, AVG(villa_schedules.price) as average_price")
    @v1_villas = Villa.format_villa_array(villas) 
  end

  # GET /v1/villas/1 or /v1/villas/1.json
  def show
  end

 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_v1_villa
      @v1_villa = V1::Villa.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def v1_villa_params
      params.require(:villa).permit(:name, :status).each_value { |value| value.try(:strip!) }
    end

    def v1_villa_schedule_params
      params.require(:villa).permit(:name, :status).each_value { |value| value.try(:strip!) }
    end

    def seller_params
      if params[:seller][:preferred_courier_id]
        params[:seller][:preferred_courier_id] = nil
      end
      params.require(:villa).permit(:name, :status).each_value { |value| value.try(:strip!) }
    end

    def seller_brand_params
        data = params.require(:seller).permit({seller_brands:[ :id, :manufacturer_brand_id, :selling_model, :status, :facility_code, :model_type, :margin_percentage, :cancellation_commission] })
        data[:seller_brands].each{ |x| x.each_value { |value| value.try(:strip!) } }
        data
    end
end
