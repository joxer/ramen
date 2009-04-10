require 'rubygems'
require 'rack'
require 'rack/file'
require 'activerecord'
require File.dirname(__FILE__) + "/Classes/Core/Controller.rb"



class MethodHandler 

  def call(env)
       
    
    con = Controller.new
    req = Rack::Request.new(env)
   
    msg = con.send(req['method'].to_sym) 
    return [200, {"Content-Type" => "text/html", "Content-Length" => msg.length.to_s} , msg]
          
   end
end


#inf = Proc.new { |env| [200, {'Content-Type' => 'text/plain'}, env.inspect] }	
app = Rack::Builder.new do

map "/"  do
  
  run Rack::File.new("public_html/")    
end

map "/method" do
  
  run MethodHandler.new
  
end
end



run app

