
class Hash

  def self.squared_euclidean_distance(lhs, rhs)
	#puts lhs.to_s, rhs.to_s
	rhs.merge!(lhs) { |key, v1, v2| v1 - v2 }
	#puts rhs.to_s
=begin	sum = 0
	rhs.each do | key, value |
		sq =  (rhs[key])**2
		sum += sq
		puts sq
		end
		puts sum
		return sum
=end	#puts rhs[0]
#=begin
		
	sum = rhs.inject(0)  do | sum, (key, value) |
		#sum + value
		sum + (value**2)
		#puts "value", value
		end
		puts "sum", sum
		return sum
#=end
	#puts rhs[:x]**2+rhs[:y]**2+rhs[:z]**2
	#puts Math.sqrt((lhs[:x]-rhs[:x])**2+(lhs[:y]-rhs[:y])**2)
  end

  def squared_euclidean_distance(rhs)
    Hash.squared_euclidean_distance(self, rhs)
  end

end

   { :x => 1, :y => 2 }.squared_euclidean_distance({ :x => 4, :y => 6 })
raise "invalid distance between two different hashes" unless 14 == ( { :x => 1, :y => 2 }.squared_euclidean_distance({ :z => 3 }) )
raise "invalid distance between empty hashes" unless 0 == ( {}.squared_euclidean_distance({}) )
raise "invalid distance between two overlapping hashes" unless 10 == ( { :x => 2, :y => 3 }.squared_euclidean_distance({ :y => 4, :x => 5 }) )
raise "invalid distance between two partially overlapping hashes" unless 30 == ( { :x => 2, :y => 3 }.squared_euclidean_distance({ :y => 4, :z => 5 }) )
raise "invalid distance between two partially overlapping hashes with keys other than :x, :y and :z" unless 30 == ( { :a => 2, :b => 3 }.squared_euclidean_distance({ :b => 4, :c => 5 }) )
raise "invalid distance between a hash and an empty hash" unless 500 == ( { :x => 10, :y => 20 }.squared_euclidean_distance({}) )
raise "invalid distance between an empty hash and a hash" unless 500 == ( {}.squared_euclidean_distance({ :x => 10, :y => 20 }) )
puts "correct results in squared_euclidean_distance"

    #{ :x => 1, :y => 2 }.squared_euclidean_distance({ :x => 3, :y => 3 })
	#{}.squared_euclidean_distance({}) # 0
    #{ :x => 1, :y => 2 }.squared_euclidean_distance({ :z => 3 }) # 14
    #{ :x => 2, :y => 3 }.squared_euclidean_distance({ :y => 4, :z => 5 }) # 30
    #{ :x => 2, :y => 3 }.squared_euclidean_distance({ :y => 4, :x => 5 }) # 10
    #{ :x => 10, :y => 20 }.squared_euclidean_distance({}) # 500
    #{}.squared_euclidean_distance({ :x => 10, :y => 20 }) # 500