include Mongrel;
class Http < Mongrel::HttpHandler
  
  def process(request, response)
    begin
      params = QueryString.parse(request.params['QUERY_STRING'])
      page_to_show = request.params['REQUEST_PATH'].gsub("http/", "")
      response.start(200) do |head, out|
        
        out.write(IO.readlines("public_html/#{page_to_show}.html").join(""))
      end
    rescue NameError => e
      
      puts "=> *** HTTP HANDLER ERROR *** "
    end
    
    
    
  end
end
  


#handler the http request for generic method

class MethodHandler < HttpHandler

  def process(request, response)
    begin
      params = QueryString.parse(request.params['QUERY_STRING'])
      
      con = Controller.new
      
      response.start(200) do |head,out|
        head["Content-Type"] = "text/html"
        
        out.write(con.send params['method'].to_sym)
      end
    rescue NameError => e
      puts e if $debug != false
      puts "=> *** METHOD HANDLER ERROR ***"
      
    end
  end
end


#handler the http request for Socket method

class Socket_Handler < HttpHandler
  def process(request, response)
    begin
      params = QueryString.parse(request.params['QUERY_STRING'])
      sock = Socket.new(params['url'])
      response.start(200) do |head,out|
        
        
        
        head["Content-Type"] = "text/html"
        out.write(sock.send params['method'].to_sym)
      end
    rescue NameError,ArgumentError => e
      puts "#{e}" if $debug != false
      puts "=> *** SOCKET HANDLER ERROR *** "
      
    end
  end
end




class File_Handler < HttpHandler
  def process(request, response)
    begin
      params = QueryString.parse(request.params['QUERY_STRING'])
      file = Files.new(params['file'])
      response.start(200) do |head,out|
      
        
        head["Content-Type"] = "text/html"
        
        
        
        out.write(file.send params['method'].to_sym)
        
      end
      
    rescue NameError, Errno::ENOENT => e
      puts e if $debug != false
      puts "=> *** FILE HANDLER ERROR ***"
      
    end

  end
end
