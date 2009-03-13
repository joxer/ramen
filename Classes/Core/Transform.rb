class Modify

  def initialize(name)

    @name = name
    @file = File.new("m/#{name}.eruby", "r+")
    @read = @file.readlines.join
    
  end

  def transform
    
  end
  

end
