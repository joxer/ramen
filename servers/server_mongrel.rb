

require 'mongrel'


require File.dirname(__FILE__) + "/../servers/Handler/varius.rb"
require File.dirname(__FILE__) + "/../Classes/Core/Controller.rb"
require File.dirname(__FILE__) + "/../Classes/Core/File.rb"
require File.dirname(__FILE__) + "/../Classes/stdlib/socket.rb"
require File.dirname(__FILE__) + "/../servers/Handler/QueryString.rb"

 
 h = HttpServer.new("0.0.0.0", "3000")
 
 #varius url
 


 h.register('/', DirHandler.new("public_html", true, 'index.html'))
 h.register('/method', MethodHandler.new)
 h.register('/method/socket', Socket_Handler.new)
 h.register('/file', File_Handler.new)
 h.register('/http/', Http.new)
 #h.register('/test', DirHandler.new("test", true, 'index.html'))
 h.run.join


