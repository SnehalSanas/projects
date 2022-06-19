json.array!(@v1_villa_rates ) do |villa|
    json.extract! villa, :name, :availability, :rate_price, :rate_price_gst
  end


