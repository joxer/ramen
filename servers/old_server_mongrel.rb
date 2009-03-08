 require 'mongrel'
 require 'erb'
 require 'Classes/Core/Controller.rb'
 require 'Classes/stdlib/socket.rb'
 require 'Classes/Core/File.rb'
 require 'servers/Handler/varius.rb'
 include Mongrel;
 
 h = HttpServer.new("0.0.0.0", "3000")
 
 #varius url
 


 h.register('/', DirHandler.new("public_html", true, 'index.html'))
 h.register('/method', Handler.new)
 h.register('/method/socket', Socket_Handler.new)
 h.register('/file', File_Handler.new)
 h.register('/http/', Http.new)
 #h.register('/test', DirHandler.new("test", true, 'index.html'))
 h.run.join

