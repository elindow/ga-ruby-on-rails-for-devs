Fabricator(:role) do
	name { Faker::Lorem.words(num = 1) }
	department { Faker::Lorem.words(num = 1) }
end
