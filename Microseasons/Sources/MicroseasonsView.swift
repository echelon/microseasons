//
//  MicroseasonsView.swift
//  Japanese Microseasons
//  Based on the Swift code in https://github.com/soffes/langtons-ant
//
//  Created by Sam Soffes on 8/25/17.
//  Copyright © 2017 Sam Soffes. All rights reserved.
//

import ScreenSaver

@objc public final class MicroseasonsView: ScreenSaverView {

	private var speed: Speed = .normal

	private var boardView: BoardView? {
		willSet {
			boardView?.removeFromSuperview()
		}
	}

	private var previousSize: CGSize = .zero

	private let preferences = Preferences()

	private var preferencesWindowController: PreferencesWindowController? {
		willSet {
			preferencesWindowController?.close()
		}
	}

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
        
        let bbox1 = centeredRectangle(width: 500, height: 200, x: Int(center.x), y: Int(center.y + 200))
        let bbox2 = centeredRectangle(width: 500, height: 200, x: Int(center.x), y: Int(center.y))
        let bbox3 = centeredRectangle(width: 500, height: 200, x: Int(center.x), y: Int(center.y - 200))
        
        let season = Seasons.getSeason(0)!
        
        /*
         Fonts that work 
            - Heiti SC Light
            - Hiragino Sans W2
            - Klee Medium (must be installed via system font dialog)
            - Hannotate SC Regular (must be installed)
        */
        
        let english = "(" + season.english + ")"
        
        drawText(text: season.japanese, color: NSColor.black, fontName: "Hannotate SC Regular", fontSize: 120, rect: bbox1)
        drawText(text: season.romaji, color: NSColor.gray, fontName: "Hannotate SC Regular", fontSize: 30, rect: bbox2)
        drawText(text: english, color: NSColor.gray, fontName: "Hannotate SC Regular", fontSize: 30, rect: bbox3)
    }

	public override func configureSheet() -> NSWindow? {
		let windowController = PreferencesWindowController()
		windowController.loadWindow()
		let window = windowController.window
		preferencesWindowController = windowController
		return window
	}
	
	public override func hasConfigureSheet() -> Bool {
		return true
	}
    
    private func clearBackground(color: NSColor) {
        guard let context = NSGraphicsContext.current()?.cgContext else { return }
        context.setFillColor(color.cgColor)
        context.fill(bounds)
    }
    
    // Draw text in a box.
    func drawText(text:String, color:NSColor, fontName:String, fontSize:CGFloat, rect:CGRect) {
        let font = NSFont(name: fontName, size: fontSize)!
        
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        
        let textFontAttributes = [
            NSFontAttributeName: font,
            NSForegroundColorAttributeName: color,
            NSParagraphStyleAttributeName: style,
            ] as [String : Any]
        
        text.draw(in: rect, withAttributes: textFontAttributes)
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
