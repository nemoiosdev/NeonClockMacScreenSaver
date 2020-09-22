//
//  MyCustomScreenSaver.swift
//  MyCustomScreenSaver
//
//  Created by NgocThai on 9/22/20.
//

import ScreenSaver

private enum TimeStyle {
	case hour12
	case hour24
}

class MyCustomScreenSaver: ScreenSaverView {
	// MARK: - Initial variables
	private let timeStyle = TimeStyle.hour12
	private let calendar = Calendar.current
	private let component: Set<Calendar.Component> = [
		.year, .month, .day,
		.hour, .minute, .second
	]
	private let date = Date()
	private var currentTime: DateComponents {
		return calendar.dateComponents(component, from: date)
	}
	var hourString: String {
		return timeStyle == .hour24 ? String(currentTime.hour!) : String(currentTime.hour! - 12)
	}
	var secondString: String {
		return currentTime.second! > 9 ? String(currentTime.second!) : "0\(currentTime.second!)"
	}
	var minuteString: String {
		return String(currentTime.minute!)
	}
	
	// MARK: - UI
	private let hour: NSLabel = {
		let label = NSLabel()
		label.textColor = .white
		label.font = NSFont.systemFont(ofSize: 50)
		return label
	}()
	
//	private let minute: NSLabel = {
//		let label = NSLabel()
//		label.textColor = .white
//		label.font = NSFont.systemFont(ofSize: 50)
//		return label
//	}()
//
//	private let second: NSLabel = {
//		let label = NSLabel()
//		label.textColor = .white
//		label.font = NSFont.systemFont(ofSize: 50)
//		return label
//	}()
	
	// MARK: - Initialization
	override init?(frame: NSRect, isPreview: Bool) {
		super.init(frame: frame, isPreview: isPreview)
		configure()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		configure()
	}
	
	// MARK: - Lifecycle
	
	override func animateOneFrame() {
		super.animateOneFrame()
		
		updateTime()
	}
	
	func updateTime() {
		hour.stringValue = "\(hourString):\(minuteString):\(secondString)"
	}
}

extension MyCustomScreenSaver {
	func configure() {
		animationTimeInterval = 1
		addSubviews()
		addContraints()
	}
	
	func addSubviews() {
		addSubview(hour)
	}
	
	func addContraints() {
		hour.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		hour.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
	}
}
