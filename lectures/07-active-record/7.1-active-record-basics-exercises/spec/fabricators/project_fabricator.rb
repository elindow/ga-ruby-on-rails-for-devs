Fabricator(:project) do
	name { Faker::Name.name }
	employee_count { Fabricate.sequence(:id) { |i| i } }
end
