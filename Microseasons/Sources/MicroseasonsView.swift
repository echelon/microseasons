//
//  MicroseasonsView.swift
//  Japanese Microseasons
//
//  Created by Sam Soffes on 8/25/17.
//  Copyright © 2017 Sam Soffes. All rights reserved.
//

import ScreenSaver

@objc public final class MicroseasonsView: ScreenSaverView {

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

	public override func draw(_ rect: NSRect) {
		guard let context = NSGraphicsContext.current()?.cgContext else { return }
        context.setFillColor(NSColor.white.cgColor)
        //context.setFillColor(boardView?.theme.backgroundColor.cgColor ?? NSColor.white.cgColor)
        context.fill(bounds)
        
        
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d"
        let nameOfMonth = dateFormatter.string(for: date)!
        
        let month = calendar.component(.month, from: date)
        
        let _rect1 = CGRect(x: 50, y: 130, width: 200, height: 200)
        
        //drawMyText(myText: "Testing 1234", textColor: NSColor.black, FontName: "Helvetica Bold", FontSize: 20, inRect: _rect1)
        drawMyText(myText: nameOfMonth, textColor: NSColor.black, FontName: "Helvetica Bold", FontSize: 10 , inRect:_rect1)
        

        
        let _rect2 = CGRect(x: 40, y: 100, width: 100, height: 100)
        
        drawMyText(myText: "Wild geese returnz", textColor: NSColor.black, FontName: "Helvetica Bold", FontSize: 20 , inRect:_rect2)
	}


	// MARK: - ScreenSaverView
	
	public override var animationTimeInterval: TimeInterval {
		get {
			return 1 / 60
		}

		set {}
	}

	public override func animateOneFrame() {
		for _ in 0..<speed.ticksPerFrame {
			boardView?.board.tick()
		}
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
    
    func drawMyText(myText:String,textColor:NSColor, FontName:String, FontSize:CGFloat, inRect:CGRect){
        
        let textFont = NSFont(name: FontName, size: FontSize)!
        let textFontAttributes = [
            NSFontAttributeName: textFont,
            NSForegroundColorAttributeName: textColor,
            ] as [String : Any]
        
        myText.draw(in: inRect, withAttributes: textFontAttributes)
    }
	

	// MARK: - Private

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
		speedDidChange()

		NotificationCenter.default.addObserver(self, selector: #selector(resetBoard), name: Preferences.boardDidChange, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(speedDidChange), name: Preferences.speedDidChange, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(themeDidChange), name: Preferences.themeDidChange, object: nil)
	}
}
