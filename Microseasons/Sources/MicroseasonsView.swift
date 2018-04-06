//
//  MicroseasonsView.swift
//  Japanese Microseasons
//
//  Created by bt on 10/12/17.
//  Copyright © 2017 Brandon Thomas. All rights reserved.
//
//  Based on the Swift code in https://github.com/soffes/langtons-ant
//

import ScreenSaver

public final class MicroseasonsView: ScreenSaverView {

	private var previousSize: CGSize = .zero

	public override init?(frame: NSRect, isPreview: Bool) {
		super.init(frame: frame, isPreview: isPreview)
	}
	
	public required init?(coder: NSCoder) {
		super.init(coder: coder)
    }

	public override func viewDidMoveToWindow() {
		super.viewDidMoveToWindow()
	}

	public override func resizeSubviews(withOldSize oldSize: NSSize) {
		super.resizeSubviews(withOldSize: oldSize)
	}
    
    func getCenter() -> CGPoint {
        return CGPoint(x: self.frame.size.width / 2.0, y: self.frame.size.height / 2.0)
    }

	public override func draw(_ rect: NSRect) {
        clearBackground(color: NSColor.black)
	}
	
	public override var animationTimeInterval: TimeInterval {
		get {
			return 1 / 60
		}

		set {}
	}

	public override func animateOneFrame() {
        clearBackground(color: NSColor.white)
        
        let center = getCenter()
        
        let bbox1 = centeredRectangle(width: 800, height: 200, x: Int(center.x), y: Int(center.y + 100))
        let bbox2 = centeredRectangle(width: 800, height: 200, x: Int(center.x), y: Int(center.y - 120))
        let bbox3 = centeredRectangle(width: 800, height: 200, x: Int(center.x), y: Int(center.y - 200))
        
        let season = Seasons.getCurrentSeason()
        
        /*
         Fonts that work 
            - Heiti SC Light
            - Hiragino Sans W2
            - Klee Medium (must be installed via system font dialog)
            - Hannotate SC Regular (must be installed)
        */
        
        let english = "(" + season.english + ")"
        
        // Note: This font might get uninstalled via OS upgrades or patches. Check the Font Book and click "Download"!
        let typeface = "Hannotate SC Regular"
        
        drawText(text: season.japanese, color: NSColor.black, fontName: typeface, fontSize: 120.0, rect: bbox1)
        drawText(text: season.romaji, color: NSColor.gray, fontName: typeface, fontSize: 30.0, rect: bbox2)
        drawText(text: english, color: NSColor.gray, fontName: typeface, fontSize: 30.0, rect: bbox3)
    }

	public override var configureSheet: NSWindow? {
        // TODO: If you want to provide configurations, build and expose the dialog window here.
		return nil
	}
	
	public override var hasConfigureSheet: Bool {
		return false
	}
    
    private func clearBackground(color: NSColor) {
        guard let context = NSGraphicsContext.current?.cgContext else { return }
        context.setFillColor(color.cgColor)
        context.fill(bounds)
    }
    
    // Draw text in a box.
    func drawText(text:String, color:NSColor, fontName:String, fontSize:CGFloat, rect:CGRect) {
        if let font = NSFont(name: fontName, size: fontSize) {
            let style = NSMutableParagraphStyle()
            style.alignment = .center
            
            let attributes: [NSAttributedStringKey : Any] = [
                .font: font,
                .foregroundColor: color,
                .paragraphStyle: style,
                ]
            
            text.draw(in: rect, withAttributes: attributes)
        }
    }
	
    // Create a rectangle of dimensions (width,height) centered at (x, y).
    func centeredRectangle(width: Int, height: Int, x: Int, y: Int) -> CGRect {
        let xOff = Int(Float(width) / 2.0)
        let yOff = Int(Float(height) / 2.0)
        
        let drawX = x - xOff
        let drawY = y - yOff
        
        return CGRect(x: drawX, y: drawY, width: width, height: height)
    }
}
