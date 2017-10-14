//
//  PreviewWindowController.swift
//  Japanese Microseasons
//
//  Created by bt on 10/12/17.
//  Copyright © 2017 Brandon Thomas. All rights reserved.
//
//  Based on the Swift code in https://github.com/soffes/langtons-ant
//

import AppKit

final class PreviewWindowController: NSWindowController {

	// MARK: - Properties

	private let screenSaverView = MicroseasonsView()


	// MARK: - NSWindowController

	override func windowDidLoad() {
		super.windowDidLoad()

		window?.contentView = screenSaverView

		Timer.scheduledTimer(timeInterval: screenSaverView.animationTimeInterval, target: screenSaverView, selector: #selector(MicroseasonsView.animateOneFrame), userInfo: nil, repeats: true)
	}


	// MARK: - Actions

	@IBAction func showPreferences(_ sender: NSObject?) {
		guard let sheet = screenSaverView.configureSheet(), let window = window else { return }
		
		window.beginSheet(sheet) { _ in
			sheet.close()
		}
	}
}
