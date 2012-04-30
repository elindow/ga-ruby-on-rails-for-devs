#\ -p 1337

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
	
class SayNothing
    include Initializer
  end

class ContentTypeHTML
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    headers.merge!( 'Content-Type' => 'text/html' )
    return [status, headers, body]
  end
end

class HelloWorld
  def call(env)
    return [200, {}, ["Hello world!#3"]]
  end
end


use Rack::ContentLength
use ContentTypeHTML
use SayNothing
use SayHi
run HelloWorld.new