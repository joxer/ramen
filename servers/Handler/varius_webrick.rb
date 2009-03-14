include WEBrick



class MethodHandler < HTTPServlet::AbstractServlet
  
  def do_GET(req, res)
    begin
      params = QueryString.parse( req.query_string )
      
      con = Controller.new
      
      res.body = con.send params['method'].to_sym
      
      res['Content-Type'] = 'text/html'
      
    rescue NameError => e
      
      puts "=> *** METHOD HANDLER ERROR ***"

    end

  end


end


class Socket_Handler < HTTPServlet::AbstractServlet

  def do_GET(req, res)

    begin
      
      params = QueryString.parse(req.query_string)
      
      sock = Socket.new(params['url'])
      
      res.body =  sock.send params['method'].to_sym
      
      res['Content-Type'] = 'text/html'
      
    rescue NameError , ArgumentError => e
      puts "=> *** SOCKET HANDLER ERROR ***"
    end
  end

end


class File_Handler < HTTPServlet::AbstractServlet


  def do_GET(req, res)
    begin
      params = QueryString.parse(req.query_string)
      
      file = File.new(params['file'])
      
      res.body = file.send params['method'].to_sym
      
      res['Content-Type'] = 'text/html'
    rescue NameError => e
      
      puts "=> *** FILE HANDLER ERROR ***"
      
    end
  end

end
