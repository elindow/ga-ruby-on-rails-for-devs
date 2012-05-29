Fabricator(:employee) do

  name { Faker::Name.name }
  address { Faker::Address.street_address }
  start_date { "01/01/12" }
  
  role_id { Fabricate.sequence(:id) { |i| i } }
 
end
