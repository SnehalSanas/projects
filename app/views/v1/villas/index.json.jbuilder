json.count @v1_villas.length
json.villas do |json|
json.array!(@v1_villas ) do |villa|
    json.extract! villa, :name, :villa_address
    json.availability VillaSchedule.availabilities.invert[villa[:availability]]
    json.average_price villa[:price]
    json.average_gst_price villa[:gst_price]
end
end




