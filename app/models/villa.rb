class Villa < ApplicationRecord
    has_many :villa_schedules
    validates_presence_of :name
	validates_uniqueness_of :name
    validates_length_of :name, maximum: 100
  

    enum status: [:active, :inactive]



    def self.format_villa_array(villas)  
        result = []
        if villas.present?
            [*villas].each do |villa|
                result << {
                    name: villa[0],
                    availability: villa[1],
                    price: villa[2],
                    gst_price: get_gst_price(villa[2]),
                    villa_address: villa[3]
                }
            end
        end    
        result
    end

    def self.get_gst_price(price)
        price + ( price * 18/100)
    end
    
  
end
