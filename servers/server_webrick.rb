require 'webrick'
require 'erb'


require File.dirname(__FILE__) + "/../Classes/Core/Controller.rb"
require File.dirname(__FILE__) + "/../servers/Handler/varius_webrick.rb"
require File.dirname(__FILE__) + "/../Classes/Core/File.rb"
require File.dirname(__FILE__) + "/../Classes/stdlib/socket.rb"
require File.dirname(__FILE__) + "/../servers/Handler/QueryString.rb"



class Handler < HTTPServlet::AbstractServlet

  def do_POST(req, res)
    p req.path
    m = req.path.split("/method/:")[1]
    res.body = GMethod.new.method(m).call
    res['Content-Type'] = "text/html"
  end
end


server = HTTPServer.new(:Port => 3000)
server.mount("/method", MethodHandler)
server.mount("/socket", Socket_Handler)
server.mount("/", HTTPServlet::FileHandler, File.dirname(__FILE__) + "/../public_html/", true)
server.mount("/file" , File_Handler)
trap("INT"){ server.shutdown }

server.start
