require File.expand_path("../boot.rb", __FILE__)

require "action_controller/railtie"

Bundler.require :default, Rails.env

module HelloWorld
	class Applicaiton < Rails::Application
		config.encoding = "utf-8"
		end
		end
		