require 'erb'

class ERB
  
  module Util
    
    
    def link_to(page, text)

      return "<a href='#{page}'>#{text}</a>"
    end
    
    def image_tag(image, width, height)
      width = "width='#{width}'" if width != nil
      height = "height='#{height}'" if height != nil
      
      return "<img src='#{image} #{width} #{height} />'"

    end
    
    def submit(name = nil, id = nil)
      name = "name='#{name}'" if name != nil
      id = "id='#{name}'" if id != nil
      return "<input type='submit' />"
    end
    
    def text(name = nil, id = nil, size = 30)
      name = "name='#{name}'" if name != nil
      id = "id='#{name}'" if id != nil
      return "<input type='text' size='#{size} />"
      

    end

    def css(file = "default.css")
      
      return "<link rel='stylesheet' type='ext/css' href='public_html/css/#{file}'>"

    end
    

  end
    
  
end
