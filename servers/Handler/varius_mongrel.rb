include Mongrel;
class Http < Mongrel::HttpHandler
  
  def process(request, response)
    
    params = QueryString.parse(request.params['QUERY_STRING'])
    page_to_show = request.params['REQUEST_PATH'].gsub("http/", "")
    response.start(200) do |head, out|
      
      out.write(IO.readlines("public_html/#{page_to_show}.html").join(""))
      
      
    end
  end
end




#handler the http request for generic method

class MethodHandler < HttpHandler
  def process(request, response)
    response.start(200) do |head,out|
      params = QueryString.parse(request.params['QUERY_STRING'])
      head["Content-Type"] = "text/html"
      con = Controller.new
      out.write(con.send params['method'].to_sym)
      
      
    end
  end
end

#handler the http request for Socket method

class Socket_Handler < HttpHandler
  def process(request, response)
    response.start(200) do |head,out|
      params = QueryString.parse(request.params['QUERY_STRING'])
      method =  request.params["REQUEST_PATH"].to_s
      head["Content-Type"] = "text/html"
      sock = Socket.new(params['url'])
      out.write(sock.send params['method'].to_sym)
    end
  end
end




class File_Handler < HttpHandler
  def process(request, response)
     response.start(200) do |head,out|
      params = QueryString.parse(request.params['QUERY_STRING'])
      method =  request.params["REQUEST_PATH"].to_s
      head["Content-Type"] = "text/html"
      
      file = Files.new(params['file'])
      
      out.write(file.send params['method'].to_sym)
      
      
    end
  end
end
