//
//  NSLabel.swift
//  MyCustomScreenSaver
//
//  Created by NgocThai on 9/22/20.
//

import AppKit

class NSLabel: NSTextField {
	override init(frame frameRect: NSRect) {
		super.init(frame: frameRect)
		configure()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		configure()
	}
	
	fileprivate func configure() {
		isBezeled = false
		isSelectable = false
		drawsBackground = false
		isEditable = false
		translatesAutoresizingMaskIntoConstraints = false
	}
}

extension NSLabel {
	convenience init(textColor color: NSColor, fontSize size: CGFloat) {
		self.init()
		self.textColor = color
		self.font = NSFont.systemFont(ofSize: size)
	}
}
