json.array!(@v1_villas ) do |villa|
    json.extract! villa, :name, :availability, :average_price, :average_price_gst
   
    
  end


