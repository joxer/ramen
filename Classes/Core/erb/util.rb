require 'erb'

class ERB
  
  module Util
    
    
    def link_to(page, text)

      return "<a href='#{page}'>#{text}</a>"
    end
    
    def image_tag(image, width, height)
      width = "width='#{width}'" if width != nil
      height = "height='#{height}'" if height != nil
      
      return "<img src='#{image} #{width} #{height}>'

      

    end

  end


end
