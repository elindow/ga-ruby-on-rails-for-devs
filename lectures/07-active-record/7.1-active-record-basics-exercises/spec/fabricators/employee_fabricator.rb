Fabricator(:employee) do
  name { Faker::Name.name }
  address { Faker::Address.address }
  role_id { Fabricate.sequence(:role_id) { |i| i }}
end
