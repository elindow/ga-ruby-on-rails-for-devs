require "rubygems"
require "rack"

class HelloWorld


	def call(env)
		#puts env.to_s
		#puts Dir.pwd
	begin
		filename = env["PATH_INFO"]
	
		[200, {"Content type" => "text/html"}, [File.read(Dir.pwd+filename)]]
	
	rescue Errno::ENOENT
			[404, {"Content type" => "text/html"}, ["File not found"]]	
	rescue Exception=>e
			[500, {"Content type" => "text/html"}, [e.class]]
	
			end

	#rescue
	end
end
Rack::Handler::Mongrel.run HelloWorld.new,{ :Port=>9292 }