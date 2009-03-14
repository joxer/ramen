#!/usr/bin/ruby
puts "=> ramen started"
require 'Classes/Core/Load_library.rb'
#this file run the server


print "=> starting mongrel...."
if(@mongrel == false)
  print "OK!"
  require 'servers/server_mongrel' 
else
  print "FAIL!\n"
  puts "=> Starting Webrick...."
  require 'servers/server_webrick'
  puts "OK!"
end


