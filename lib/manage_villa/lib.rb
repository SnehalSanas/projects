# frozen_string_literal: true

module ManageVilla
	module Lib
    
    def villa_list_details(params)
        order_by = (params[:sort_by].present? && params[:sort_by] == 'price') ? 'average_price desc' : 'villa_availability desc'

        pluck_statement = "villas.name, SUM(Case 
        When villa_schedules.availability = true Then 0 
        Else 1 End) AS villa_availability, AVG(villa_schedules.price) as average_price,
        CONCAT(`address`, ' ', `city`, ' ', pincode, ' ', state, ' ', country, ' ', mobile) as address"

        villas = Villa.joins(:villa_schedules)
        .where("(villa_schedules.booking_date >= '#{Date.parse(params['from'])}' and  villa_schedules.booking_date < '#{Date.parse(params['to'])}') ")
        .where(status: Villa.statuses[:active])
        .group("villas.id")
        .order(order_by)
        .limit(limit).offset(offset)
        .pluck(Arel.sql(pluck_statement))
        
        villas
    end


    def fetch_villa_details(params)
        pluck_statement = "villas.name, SUM(Case 
        When villa_schedules.availability = true Then 0 
        Else 1 End) AS villa_availability, sum(villa_schedules.price) as sum_price,  
        CONCAT(`address`, ' ', `city`, ' ', pincode, ' ', state, ' ', country, ' ', mobile) as address"

        villa = Villa.joins(:villa_schedules)
        .where(id: params[:id], status: Villa.statuses[:active])
        .where("(villa_schedules.booking_date >= '#{Date.parse(params['from'])}' and  villa_schedules.booking_date < '#{Date.parse(params['to'])}') ")
        .pluck(Arel.sql(pluck_statement))
        
        villa
    end

	end
end
