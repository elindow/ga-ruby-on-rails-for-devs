#Eric Lindow

namespace :db do
  desc "Display database configuration."
  task :config => [ :environment ] do
    # TODO: display the database configuration for current Rails environment
	info = YAML::load(IO.read(Rails.root.join('config/database.yml')))
=begin	#prints out configs for all of the environments
	info.each_pair do |k,v|
			puts "Type: #{k.to_s}"
					v.each_pair do |k1,v1| puts "Values: #{k1.to_s} => #{v1.to_s}"
			end
		end
=end
	puts "Environment: #{Rails.env}"
	puts info[Rails.env]
	end
end