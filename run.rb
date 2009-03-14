#!/usr/bin/ruby
puts "=> ramen started"

require 'Classes/Core/Load_library.rb'

print "=> starting mongrel...."
if($mongrel != false)
  puts "OK!"
  require 'mongrel'
  require 'servers/server_mongrel' 
  Server_Mongrel::run
else
  print "FAIL!\n"
  puts "=> Starting Webrick...."
  require 'servers/server_webrick'
  puts "OK!"
end


