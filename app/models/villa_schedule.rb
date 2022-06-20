class VillaSchedule < ApplicationRecord
    belongs_to :villa
    enum availability: [:true, :false]
	validates_presence_of  :villa_id, :booking_date, :price
  	validates_uniqueness_of :villa_id, scope: [:booking_date], :message=> 'This Request has already been taken'
  	
	
end
