class Villa < ApplicationRecord
    has_many :villa_schedules
    validates_presence_of :name
	validates_uniqueness_of :name
    validates_length_of :name, maximum: 100
  

    enum status: [:active, :inactive]



    def self.format_villa_array(villas)  
        result = []
        if villas.present?
            villas.each do |villa|
                final_villa = villa.reject { |c| c.blank? }
                if final_villa.present?
                        result << {
                            name: final_villa[0],
                            availability: final_villa[1],
                            price: final_villa[2],
                            gst_price: get_gst_price(final_villa[2]),
                            villa_address: final_villa[3],
                            villa_id: final_villa[4]
                        }
                end
            end
        end    
        result
    end

    def self.get_gst_price(price)
       ( price + ( price * 18/100)).round(2)
    end
    
  
end
