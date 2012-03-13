require 'rubygems' # disable this for a deployed application
require 'hotcocoa' 
require 'lib/button'
require 'lib/window'  
class Demo
  include HotCocoa

  def start          
    application name: 'Demo' do |app| 
      app.delegate = self   
      MainWin.new
    end
  end   
end

Demo.new.start