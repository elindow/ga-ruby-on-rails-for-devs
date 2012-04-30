require 'rubygems'
require 'rack'

module Initializer
    def initialize(app)
      @app = app 
    end 
    def call(env)
      status, headers, body = @app.call(env)
      body << "\nHi from #{self.class}"
      [status, headers, body]
    end 
  end

class SayHi
    include Initializer
	end
  
class HelloWorld
  
  SayHi
  
  def call(env)
      [200, {"Content-Type" => "text/html"}, ["I'm an endpoint!"]]
  end
end

Rack::Handler::Mongrel.run HelloWorld.new, :Port => 9292 # Remember the uppercase 'P'