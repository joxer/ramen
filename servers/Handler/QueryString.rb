class QueryString

  
  def self.parse(string)
    result = Hash.new
   
    if string != nil
      if string =~ /&/
          string.split("&").each do |s|
          
          r1 , r2 = s.split("=")
          
          result[r1] = r2
          
        end
        return result
      else
        
        r1 , r2 = string.split("=")
        
        result[r1] = r2
        
        
        return result
        
      end
    end
    return nil
  end
end
