class V1::VillasController < ApplicationController
  include ::ManageVilla::Lib
  before_action :set_v1_villas, only: [:index]
  before_action :set_v1_villa, only: [:get_rates]


  # GET /v1/villas or /v1/villas.json
  def index
    @v1_villas = Villa.format_villa_array(@villas)
  end

  # GET /v1/villas/1 or /v1/villas/1.json
  def get_rates
    binding.pry
    @v1_villa = Villa.format_villa_array(@villa) 
  end

 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_v1_villas
       @villas = villa_list_details(params)
    end

    def set_v1_villa
      @villa = fetch_villa_details(params)
    end
   

end
