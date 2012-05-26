#basic Rack webserver
#Eric Lindow

require "rubygems"
require "rack"

class HelloWorld
	MIME_TYPES = {
			".html" => "text/html",
			".png" => "image/png",
			".jpg" => "image/jpg",
			".gif" => "image/gif"
			}
			
	def call(env)
	begin
		filename = env["PATH_INFO"]
		ext = File.extname(filename)
		filename = URI.decode(filename)
		if filename[-1] == "/" || ext == ""		#I know this isn't right though it works in this context
			filename += "/index.html"
				end
		ct = MIME_TYPES[ext] || "text/html"
		data = File.binread(Dir.pwd+filename)		
		size = data.length
		[200, {"Content type" => ct, "Content length" => size.to_s}, [data]]

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