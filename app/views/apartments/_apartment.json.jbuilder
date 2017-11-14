json.extract! apartment, :id, :address_1, :address_2, :city, :postal, :state, :country, :contact_info, :bm_name, :bm_phone, :bm_hours, :created_at, :updated_at
json.url apartment_url(apartment, format: :json)
