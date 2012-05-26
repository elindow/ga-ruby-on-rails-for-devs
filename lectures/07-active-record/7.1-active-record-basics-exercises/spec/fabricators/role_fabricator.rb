Fabricator(:role) do
	department { Faker::Word.word }
	name { Faker::Name.name }
end
