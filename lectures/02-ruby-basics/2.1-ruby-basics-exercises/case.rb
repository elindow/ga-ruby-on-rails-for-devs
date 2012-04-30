

for a in [ 1, 7, 'A', 2, 'Z' ]
case 
when a.to_i > 0
		if a%2==1 then o = "odd" 
		else o = "even"
	end
	puts "#{a} is an #{o} number\n"
when a.class == String
	#puts a.class
	puts "#{a} is a letter"
#when > 0
	#puts "#{a} is a number\n"
	end
end