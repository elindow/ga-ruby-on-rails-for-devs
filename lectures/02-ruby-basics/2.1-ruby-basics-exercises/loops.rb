# case / when / else
case 2 + 2
when 3 + 2 then puts "2+2 is 5"
when 4 then puts "2+2 is 4"
else puts "2+2 is something else"
end

puts "\nCase statement example\n"
a = (10*rand).round
#a = rand(11) would do the same

(0..10).each do |i|
a = (10*rand).round
case a
when 0..5
  puts "#{a}: Low"
when 6
  puts "#{a}: Six"
when 7..8
  puts "#{a}: lucky you!"
else
  puts "#{a}: Cheese toast!"
end
end

puts ""
#if is an expression, returns the last executed line
(3..7).each do |a|
puts(if a < 5 then "#{a} less than 5" else "#{a} greater than 5" end)
end

puts ""
#if can come at the end of a statement
(3..7).each do |a|
puts "#{a} less than 5" if a < 5
puts "Cheese sandwich" unless a == 4
end

puts ""
#looping through an array
[ "rouge", 1, (1..5) ].each do |i|
  puts "#{i} (#{i.class})"
end