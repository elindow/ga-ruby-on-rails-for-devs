#Eric Lindow
#Assignment 2.2

=begin

Add a `squared_euclidean_distance` method to the `Hash` class that takes another `Hash` as a parameter and calculates the euclidean distance with another Hash. For example, a Euclidean distance between `{ :x => 1, :y => 2 }` and `{ :x => 3, :y => 4 }` is `(1 - 3)^2 + (2 - 4)^2`.

    {}.squared_euclidean_distance({}) # 0
    { :x => 1, :y => 2 }.squared_euclidean_distance({ :z => 3 }) # 14
    { :x => 2, :y => 3 }.squared_euclidean_distance({ :y => 4, :z => 5 }) # 30
    { :x => 2, :y => 3 }.squared_euclidean_distance({ :y => 4, :x => 5 }) # 10
    { :x => 10, :y => 20 }.squared_euclidean_distance({}) # 500
    {}.squared_euclidean_distance({ :x => 10, :y => 20 }) # 500

=end

class Hash

  def self.squared_euclidean_distance(lhs, rhs)
	#=> ((lhs[:x]-rhs[:x])**2+(lhs[:y]-rhs[:y])**2)	#my template for understanding calculating the value, i.e. the hypotenuse (when only two points) squared
	#=> rhs[:x]**2+rhs[:y]**2+rhs[:z]**2+...		#a template for desired return value when rhs contains each single point and differences between points where there had been dupes
													#merging flattens so there is only one value for every point, in effect treating duplicates as a special case
	#puts lhs.to_s, rhs.to_s						#I used this to inspect initial values

=begin	
	#original version, using do to enumerate
	
	nhs = rhs.merge(lhs) { |key, v1, v2| v1 - v2 }	#copy each point to new array, where duplicate key, copy difference between values
	sum = 0											#initialize return value
	nhs.each do | key, value |						#enumerate object
			sum +=(nhs[key])**2						#sum squares
		end	
	puts "sum from original version is #{sum}"		#value check
	return sum
=end

=begin
	#this version uses inject
	
	nhs = rhs.merge(lhs) { |key, v1, v2| v1 - v2 }	#copy each point to new array, where duplicate key, copy difference between values
	sum = nhs.inject(0)  do | sum, (key, value) |	#this will 'inject' sum with previous value of sum and operation defined by block
			sum + (value**2)
		end
		puts "sum from version using inject is #{sum}"
		return sum
=end
	#minimalist version that replaces original rhs with difference of each point (assuming that's legal), could just as easily replace lhs by flipping the vars
	return rhs.merge!(lhs) { |key, v1, v2| v1 - v2 }.inject(0) { | sum, (key, value) | sum + (value**2)}
end

  def squared_euclidean_distance(rhs)
    Hash.squared_euclidean_distance(self, rhs)
  end

end

sed = { :x => 1, :y => 1 }.squared_euclidean_distance({ :x => 4, :y => 5 })			#3,4,5 triangle test case
puts "\nHypotenuse of right triangle with legs of 3 and 4 (or distance between points) would be #{Math.sqrt(sed)}", ""

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