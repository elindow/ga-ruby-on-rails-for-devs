#ruby functions

def my_function( a )
  puts "Hello, #{a}"
  return a.length
end

for a in ["cow","chicken","horse"]

len = my_function( a )
puts "My secret word is #{len} long"

end

