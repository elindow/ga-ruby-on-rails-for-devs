class Color
  def initialize(name = nil)
    @name = name
  end
  def name=(value)
    @name = value
  end
  def name
    @name
  end
end

puts Color.new.inspect # <Color: @name=nil>
puts Color.new("red").inspect # <Color: @name="red">

#hash
a = { "fish" => "shark",
"tool", "hammer"
}

puts h["fish"]
puts h["tool"]

h = { :fish => "shark",
:tool, "hammer"
}

h = { fish : "shark",
    tool : "hammer"
}

#symbols are global enums 

h.each_pair { |k,v|
	puts "#{k} is #{v}
	end
	
	hashes can be nested
	
	h.keys #returns keys
	h.values #returns values
	
	#arrays and hashes are enumerable:
	
	#mapping:
	[1,2].map { |i|
		i * 2
		}
		
	[1, nil, 2].map ( |i|
		puts i
		i.nil
		i.nil ? nil : i*2
		
#inject:

[1,2,3,4].inject(0) { |result, element| 
	result + element
	}
	#=> 10
	
	#tap chains blocks
	1.tap {|i| puts i }.tap {|I| puts i*2 }
	
	
#[1,2] | [3,4]  test 

# "test" || "foo" returns test but if first obj is nil returns second

# server ||= "localhost"

"test *= /= etc




		}
		# =>[false, true, false]

