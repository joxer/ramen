class Image


  def self.scan

    image = read.scan(/:image_tag*/)

    for i in links

      tmp = i.gsub(":image_tag", "").split(";")
      i = "<img src='image/#{tmp[0]}>"
      

    end
    


  end

end
