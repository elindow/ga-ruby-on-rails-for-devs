Fabricator(:player) do
	fname { Fabricate.sequence(:fname) { |i| "Fname #{i}" } }
	lname { Fabricate.sequence(:lname) { |i| "Lname #{i}" } }
	atbats { Fabricate.sequence(:atbats) { |i| i + 1} }
	hits { Fabricate.sequence(:hits) { |i| i } }
	runs { Fabricate.sequence(:runs) { |i| i } }
	rbi { Fabricate.sequence(:rbi) { |i| i } }
end	