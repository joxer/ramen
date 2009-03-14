require 'erb'

begin
  require 'rubygems'
  
rescue LoadError
  puts "=> rubygems not found"
  puts "** INSTALL RUBYGEMS FIRST! **"
  exit(1)
end

begin 
  require 'active_record'
rescue LoadError
  puts "=> activerecord not found"
  puts "** INSTALL ACTIVERECORD **"
  puts "type gem install activerecord"
  exit(1)
end

begin
  require 'sqlite3'
rescue LoadError
  puts "=> sqlite3 for ruby not found"
  puts "** INSTALL SQLITE FOR RUBY**"
  exit(1)
end

begin
  require 'mongrel'
  $mongrel = true
rescue LoadError
  $mongrel = false
end
