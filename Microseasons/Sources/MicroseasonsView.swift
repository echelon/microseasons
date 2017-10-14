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

    struct Dimensions {
        let width: Int
        let height: Int
        
        init(width: Int, height: Int) {
            self.width = width
            self.height = height
        }
        
        public static func getDisplayResolution() -> Dimensions? {
            guard let screen = NSScreen.main() else {
                return nil
            }
            
            let rect: NSRect = screen.frame
            let height = Int(rect.size.height)
            let width = Int(rect.size.width)
            
            return Dimensions(width: width, height: height)
        }
    }
    
	// MARK: - Properties

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

	
	// MARK: - Initializers

	public override init?(frame: NSRect, isPreview: Bool) {
		super.init(frame: frame, isPreview: isPreview)
		initialize()
	}
	
	public required init?(coder: NSCoder) {
		super.init(coder: coder)
		initialize()
	}


	// MARK: - NSView

	public override func viewDidMoveToWindow() {
		super.viewDidMoveToWindow()
		setupBoard()
	}

	public override func resizeSubviews(withOldSize oldSize: NSSize) {
		super.resizeSubviews(withOldSize: oldSize)
		setupBoard()
	}
    
    func getCenter() -> CGPoint {
        return CGPoint(x: self.frame.size.width / 2.0, y: self.frame.size.height / 2.0)
    }

	public override func draw(_ rect: NSRect) {
        clearBackground(color: NSColor.black)
	}
    
    //public override func needsToDraw(_ rect: NSRect) -> Bool {
    //    return true
    //}


	// MARK: - ScreenSaverView
	
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
        
        drawMyText(myText: season.japanese, textColor: NSColor.black, FontName: "Hannotate SC Regular", FontSize: 100, inRect: bbox1)
        drawMyText(myText: season.romaji, textColor: NSColor.black, FontName: "Helvetica Bold", FontSize: 20, inRect: bbox2)
        drawMyText(myText: season.english, textColor: NSColor.black, FontName: "Helvetica Light", FontSize: 20, inRect: bbox3)
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
    
    func drawMyText(myText:String,textColor:NSColor, FontName:String, FontSize:CGFloat, inRect:CGRect){
        
        let textFont = NSFont(name: FontName, size: FontSize)!
        
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        
        let textFontAttributes = [
            NSFontAttributeName: textFont,
            NSForegroundColorAttributeName: textColor,
            NSParagraphStyleAttributeName: style,
            ] as [String : Any]
        
        myText.draw(in: inRect, withAttributes: textFontAttributes)
    }
	

	// MARK: - Private
    
    
    // Create a rectangle of dimensions (width,height) centered at (x, y).
    public func centeredRectangle(width: Int, height: Int, x: Int, y: Int) -> CGRect {
        let xOff = Int(Float(width) / 2.0)
        let yOff = Int(Float(height) / 2.0)
        
        let drawX = x - xOff
        let drawY = y - yOff
        
        return CGRect(x: drawX, y: drawY, width: width, height: height)
        
    }

	private func setupBoard() {
		if previousSize == bounds.size {
			return
		}

		previousSize = bounds.size

		let scale: CGFloat = isPreview ? 2 : 10

		/*var board = Board(size: Size(width: Int(previousSize.width / scale), height: Int(previousSize.height / scale)))*/

		// Create 9 ants
		/*let offset = Point(x: Int(Double(board.size.width) * 0.2), y: Int(Double(board.size.height) * 0.2))
		let maxX = UInt32(Double(board.size.width) * 0.6)
		let maxY = UInt32(Double(board.size.height) * 0.6)
		for i in 1...preferences.numberOfAnts {
			let x = Int(arc4random_uniform(maxX)) + offset.x
			let y = Int(arc4random_uniform(maxY)) + offset.y
			board.addAnt(named: "Ant \(i)", at: Point(x: x, y: y))
		}

		// Create some noise
		let limit = UInt32(preferences.noiseAmount)
		if limit > 0 {
			var noise = Set<Point>()
			for x in 0..<board.size.width {
				for y in 0..<board.size.height {
					if arc4random_uniform(100) < limit {
						let point = Point(x: x, y: y)
						noise.insert(point)
					}
				}
			}
			board.noise = noise
		}*/

		/*let boardView = BoardView(board: board, scale: scale)

		// Add the board as a subview
		boardView.translatesAutoresizingMaskIntoConstraints = false
		addSubview(boardView)

		// Center it
		NSLayoutConstraint.activate([
			boardView.centerXAnchor.constraint(equalTo: centerXAnchor),
			boardView.centerYAnchor.constraint(equalTo: centerYAnchor)
		])

         
		self.boardView = boardView*/
        
		themeDidChange()
	}

	@objc private func resetBoard() {
		previousSize = .zero
		setupBoard()
	}

	@objc private func speedDidChange() {
		speed = preferences.speed
	}

	@objc private func themeDidChange() {
		//boardView?.theme = preferences.darkMode ? DarkTheme() : LightTheme()
		setNeedsDisplay(bounds)
	}

	private func initialize() {
		/*speedDidChange()

		NotificationCenter.default.addObserver(self, selector: #selector(resetBoard), name: Preferences.boardDidChange, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(speedDidChange), name: Preferences.speedDidChange, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(themeDidChange), name: Preferences.themeDidChange, object: nil)
        
        startAnimation()*/
        
        
	}
}
