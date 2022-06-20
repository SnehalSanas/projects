class V1::VillasController < ApplicationController
  include ::ManageVilla::Lib
  before_action :validate_params, only: [:index, :get_rates]
  before_action :set_v1_villas, only: [:index]
  before_action :set_v1_villa, only: [:get_rates]
  


  # GET /v1/villas or /v1/villas.json
  def index
    @v1_villas = Villa.format_villa_array(@villas)
  end

  # GET /v1/villas/1 or /v1/villas/1.json
  def get_rates
    @v1_villa = Villa.format_villa_array(@villa) 
  end

 
  private

    def validate_params
      if params[:from].blank? || params[:to].blank?
        render json: {error: "Mandatory params missing e.g from: '2021-01-01' to: '2021-01-01'"}, status: 400 
      elsif !valid_date_format
        render json: {error: "Please enter valid date format"}, status: 400 
      end  
    end

    def valid_date_format
      valid = true
      begin
         Date.parse(params[:from]) && Date.parse(params[:to]) 
      rescue
        valid = false
      end
      valid
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_v1_villas
       @villas = villa_list_details(params)
    end

    def set_v1_villa
      @villa = fetch_villa_details(params)
    end
   

end
