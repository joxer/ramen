require File.dirname(__FILE__) +'/erb/util.rb'
include ERB::Util
class Erb_Handler
  
  def initialize(method)
    
    @method = method
    
    @file = File.read("m/#{@method}.eruby")
    end
  
  def run
    

    @uh = ERB.new(@file)
    @uh.result
  end
end
