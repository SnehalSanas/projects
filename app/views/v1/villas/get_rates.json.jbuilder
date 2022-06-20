villa = @v1_villa.first
if villa.present?
  json.extract! villa, :name , :villa_address     
  json.availability VillaSchedule.availabilities.invert[villa[:availability]]
  json.rate_price villa[:price]
  json.rate_gst_price villa[:gst_price]
end







