require "rubygems"
require "rack"

class HelloWorld

	def call(env)
	begin
		filename = env["PATH_INFO"]
		ext = File.extname(filename)
 		size = filename.size
		filename = URI.decode(filename)
		if filename[-1] == "/" || ext == ""
			filename += "/index.html"
				end
		ct = "text/html"
		if ext == ".png" then ct = "image/png" end
		if ext == ".jpg" then ct = "image/jpg" end			
		[200, {"Content type" => ct, "Content length" => size.to_s}, [File.binread(Dir.pwd+filename)]]
	
	rescue Errno::EACCES
			[550, {"Content type" => "text/html"}, ["550 Permission denied"]]	
	rescue Errno::ENOENT
			[404, {"Content type" => "text/html"}, ["404 File not found"]]	
	rescue Exception=>e
			[500, {"Content type" => "text/html"}, [e,'\nError class:',e.class]]
			end
	end
end
Rack::Handler::Mongrel.run HelloWorld.new,{ :Port=>9292 }