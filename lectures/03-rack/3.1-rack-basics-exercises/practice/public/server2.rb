require "rubygems"
require "rack"

class HelloWorld

	def call(env)
		#puts env.to_s
		#puts Dir.pwd
	begin
		filename = env["PATH_INFO"]
		#puts "Original filename #{filename}"
		#puts "Original path #{Dir.pwd}"
		ext = File.extname(filename)
		f = File.split(filename) 
		size = filename.size
		#puts "\n#{filename} : size= #{size}  : #{filename.to_s}"
		#puts "Name= #{filename[-1]}  dir? = #{File.directory?(filename)}"
		puts filename[-1] == "/"
		#if ext == "" 
		if filename[-1] == "/"
			filename += "/index.html"
				end

		ct = "text/html"
		if ext == ".png" then ct = "image/png" end
		if ext == ".jpg" then ct = "image/jpg" end
		#puts Dir.pwd+filename, ext, ct
		#puts "ext #{ext} path #{f[0]} file #{f[1]} new filename #{filename}"
			
		[200, {"Content type" => ct, "Content length" => size.to_s}, [File.binread(Dir.pwd+filename)]]
	
	rescue Errno::EACCES
			[550, {"Content type" => "text/html"}, ["550 Permission denied"]]	
	rescue Errno::ENOENT
			[404, {"Content type" => "text/html"}, ["404 File not found"]]	
	rescue Exception=>e
			[500, {"Content type" => "text/html"}, [e,'\nError class:',e.class]]
	
			end

	#rescue
	end
end
Rack::Handler::Mongrel.run HelloWorld.new,{ :Port=>9292 }