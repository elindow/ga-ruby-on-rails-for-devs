use Rack::ShowExceptions

use Rack::CommonLogger

require ‘rack/request’

require ‘rack/response’


module Rack

 class App

   def call(env)

     req = Request.new(env)


Response.new.finish do |res|
res.write(“”)
res.write req.fullpath
res.write(“”)
end
end
end
end


run  Rack::App.new