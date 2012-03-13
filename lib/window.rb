class MainWin < NSWindowController
  attr_writer :itsWindow
  
  def init
    initWithWindowNibName('MainMenu')
    window
    self
  end
end 