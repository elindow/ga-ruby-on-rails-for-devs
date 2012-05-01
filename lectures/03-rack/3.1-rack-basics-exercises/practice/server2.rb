require "rubygems"
require "rack"

class HelloWorld


	def call(env)
		puts env.to_s
		#puts Dir.pwd
	begin
		filename = env["PATH_INFO"]
	
		[200, {"Content type" => "text/html"}, [filename,"\n",File.read(Dir.pwd+filename)]]
	
	rescue Errno::EACCES
			[550, {"Content type" => "text/html"}, ["Permission denied"]]	
	rescue Errno::ENOENT
			[404, {"Content type" => "text/html"}, ["File not found"]]	
	rescue Exception=>e
			[500, {"Content type" => "text/html"}, [e,'\nError class:',e.class]]
	
			end

	#rescue
	end
end
Rack::Handler::Mongrel.run HelloWorld.new,{ :Port=>9292 }