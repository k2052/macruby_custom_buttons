class CustomButtonCell < NSButtonCell

  def drawBezelWithFrame(frame, inView:controlView)  
    ctx = NSGraphicsContext.currentContext       
    roundedRadius = 3.0 
    
    # Out Stroke
    ctx.saveGraphicsState()    
    outerClip = NSBezierPath.bezierPathWithRoundedRect(frame, xRadius:roundedRadius, yRadius:roundedRadius)   
    outerClip.setClip() 
        
    outerGradient = NSGradient.alloc.initWithColors([NSColor.colorWithDeviceWhite(0.20, alpha:1.0), 
      NSColor.colorWithDeviceWhite(0.21, alpha:1.0)], :atLocations => [0.0, 1.0], :colorSpace => NSColorSpace.deviceRGBColorSpace)  
    outerGradient.drawInRect(outerClip.bounds, angle:90.0) 
    ctx.restoreGraphicsState()   
  
    # BG Gradient
    ctx.saveGraphicsState()    
    backgroundPath = NSBezierPath.bezierPathWithRoundedRect(NSInsetRect(frame, 2.0, 2.0), xRadius:roundedRadius, 
      yRadius:roundedRadius)
    backgroundPath.setClip() 
    
    backgroundGradient = NSGradient.alloc.initWithColors([NSColor.colorWithDeviceWhite(0.17, alpha:1.0), 
      NSColor.colorWithDeviceWhite(0.20, alpha:1.0),  
      NSColor.colorWithDeviceWhite(0.27, alpha:1.0),
      NSColor.colorWithDeviceWhite(0.30, alpha:1.0),
      NSColor.colorWithDeviceWhite(0.42, alpha:1.0),  
      NSColor.colorWithDeviceWhite(0.50, alpha:1.0)
      ],
      :atLocations => [0.0, 0.12, 0.5, 0.5, 0.98, 1.0], 
      :colorSpace  => NSColorSpace.deviceRGBColorSpace)  
      
    backgroundGradient.drawInRect(backgroundPath.bounds, angle:270.0)   
    ctx.restoreGraphicsState()
  
    # Dark Stroke 
    ctx.saveGraphicsState()
    NSColor.colorWithDeviceWhite(0.12, alpha:1.0).setStroke()
    NSBezierPath.bezierPathWithRoundedRect(NSInsetRect(frame, 1.5, 1.5), xRadius:roundedRadius, yRadius:roundedRadius).stroke    
    ctx.restoreGraphicsState()
    
    # Inner Light Stroke
    ctx.saveGraphicsState()   
    NSColor.colorWithDeviceWhite(1.0, alpha:0.05,).setStroke
    NSBezierPath.bezierPathWithRoundedRect(NSInsetRect(frame, 2.5, 2.5), xRadius:roundedRadius, yRadius:roundedRadius).stroke
    ctx.restoreGraphicsState()  
     
    # Dark overlay on hover 
    if isHighlighted()
      ctx.saveGraphicsState()   
      NSBezierPath.bezierPathWithRoundedRect(NSInsetRect(frame, 2.0, 2.0), xRadius:roundedRadius, yRadius:roundedRadius).setClip()
      NSColor.colorWithCalibratedWhite(0.0, alpha:0.35).setFill()
      NSRectFillUsingOperation(frame, NSCompositeSourceOver)     
      ctx.restoreGraphicsState()    
    end 
  end      
end