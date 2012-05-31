Fabricator(:project) do
	name { Faker::Name.name }
	employees_count { 0 }
end
