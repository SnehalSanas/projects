class V1::VillasController < ApplicationController
  before_action :set_v1_villa, only: %i[ index, get_rates]

  # GET /v1/villas or /v1/villas.json
  def index
    @v1_villas = Villa.format_villa_array(@villas) 
  end

  # GET /v1/villas/1 or /v1/villas/1.json
  def get_rates
    @v1_villa_rates = Villa.format_villa_array(@villas) 
  end

 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_v1_villa
      order_by = (params[:sort_by].present? && params[:sort_by] == 'price') ? 'average_price desc' : 'villa_availability desc'
      @villas = Villa.joins(:villa_schedules)
      .where("(villa_schedules.booking_date between '#{v1_villa_params['from']}' and '#{v1_villa_params['to']}') ")
      .group("villas.id")
      .order(order_by)
      .limit(limit).offset(offset)
      .pluck(Arel.sql("villas.name, SUM(Case 
      When villa_schedules.availability = true Then 0 
      Else 1 End) AS villa_availability, AVG(villa_schedules.price) as average_price, sum(villa_schedules.price) as sum_price"))
      @total_results = @villas.size
    end

    # Only allow a list of trusted parameters through.
    def v1_villa_params
      params.require(:villa).permit(:from, :to)
    end

end
