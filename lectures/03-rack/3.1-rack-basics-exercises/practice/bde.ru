# This module helps converting to string every object that includes it
module Stringfier
  attr_reader :app
  def to_str
    "Your app http status is: -> #{@app[0]}<-, " + \
    "with headers: ->#{@app[1]}<-, " + \
    "and body: ->#{@app[2]}<-"
  end
end

# This class receives an array of three elements and stores it in an instance variable @app,
# the third element of the array is supposed to be the HTTP body
class MyBaseApp
  include Stringfier
  def initialize(*base_app)
    @app = base_app
  end
end

# This class wraps the MyBaseApp body with html tags and adds a text/html content
# type header
class Htmlfier
  include Stringfier
  def initialize(*base_app)
    @app = htmlfy(*base_app)
  end
  def htmlfy(base_app)
    [base_app.app[0], {'Content-type' => 'text/html'}, "<html><head><title>Htmlfied</title></head><body>#{base_app.app[2].join}</body></html>"]
  end
end

# This class converts the MyBaseApp body to json and adds a application/json content
# type header
class Jsonfier
  include Stringfier
  require 'rubygems'
  require 'json'

  def initialize(*base_app)
    @app = jsonfy(*base_app)
  end
  def jsonfy(base_app)
    [base_app.app[0], {'Content-type' => 'application/json'}, JSON.generate(base_app.app[2])]
  end
end

base_app = MyBaseApp.new(200, {}, ['Original response body'])

p "R1: " + base_app

p "R2: " + Htmlfier.new(base_app)

p "R2: " + Jsonfier.new(base_app)
