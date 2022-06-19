#rake db:seed
Villa.delete_all
VillaSchedule.delete_all

villa_atrributes = []
(0...50).map { |x|
   villa_atrributes << {
     name: Faker::Restaurant.unique.name,
     address: Faker::Address.street_address,
     city: Faker::Address.city,
     state: Faker::Address.state,
     country: 'India',
     pincode: Faker::Number.number(digits: 6),
     mobile: 9203010000 + x
    }
    }

Villa.import villa_atrributes


villa_schedule_atrributes = []
Villa.all.each do |villa|
    
    (Date.parse('2021-01-01')...Date.parse('2021-12-31')).to_a.map{|date|
    villa_schedule_atrributes << {
        villa_id: villa.id,
        availability: Faker::Boolean.boolean(true_ratio: 0.7),
        price: Faker::Number.within(range: 30000..50000),
        booking_date: date
    }
    }
end

VillaSchedule.import villa_schedule_atrributes
