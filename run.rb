#!/usr/bin/ruby

def run(debug = false)
  
  puts "=> ramen started"
  
  require 'Classes/Core/Load_library.rb'
    
    print "=> starting mongrel...."
  if($mongrel != false)
      puts "OK!"
      require 'mongrel'
      require 'servers/server_mongrel' 
      (debug == nil)?(Server_Mongrel::run):(Server_Mongrel::run(debug))
    
    else
      print "FAIL!\n"
      puts "=> Starting Webrick...."
      require 'servers/server_webrick'
      puts "OK!"
    end
  
end


if(ARGV.length == 0)
  run
else
  
  if(ARGV.include? "-h")

    puts <<-EOF

    How to run ramen:

      ruby run.rb => run ramen without external parameters
      
      extra parameters:

       -d debug

       -h this help

       -v verbose
           
    EOF

  end
  
  if(ARGV.include? "-d")
    puts " *** DEBUG MODE ***"
    run(true)

  end
  

end
