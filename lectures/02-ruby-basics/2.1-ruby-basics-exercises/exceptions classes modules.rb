#exceptions:

# base class is Exception
# RuntimeError < StandardError < Exception

begin
	raise "ooops."

rescue  Exception => e
	puts "something happened #{e.message"

end

class BadError <Runtime Error

end

raise BadError or BadError.new

#retry


t = 0
begin
	t += 1
	tweet(...)
	
rescue NetworkError+> e
	puts e.message
	retry if t< 3
end


#Inheritance:

#class Dog < Animal


#modules can't be instantiated

module Incremetable
	def increment
		self.to_i + 1
		
		
#have to define to_i in the class



#modules are included in actual classes 

#reflection
dog.methods
dog.method(:speak)


#class methods:

class Dog
	def bark
	end
	
	def self.hasbreed?
		true
	end
end

Exercise:

squared euclidian distance between hashes 

