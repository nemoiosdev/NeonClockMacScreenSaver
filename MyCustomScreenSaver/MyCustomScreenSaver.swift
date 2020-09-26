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

	var hourString: String {
		return timeStyle == .hour24 ? Helper.Current.hour24 : Helper.Current.hour12
	}
	
//	override var hasConfigureSheet: Bool {
//		return true
//	}
	
	// MARK: - UI
	private let hour = NSLabel()
	private let minute =  NSLabel()
	private let hourExtend =  NSLabel()
	private let timeSeparator: NSLabel = {
		let label = NSLabel()
		label.stringValue = ":"
		return label
	}()
	private let timeStackView: NSStackView = {
		let stack = NSStackView()
		stack.orientation = .horizontal
		stack.distribution = .fill
		stack.spacing = 0
		stack.translatesAutoresizingMaskIntoConstraints = false
		return stack
	}()
	private let date =  NSLabel()
	
	// MARK: - Initialization
	override init?(frame: NSRect, isPreview: Bool) {
		super.init(frame: frame, isPreview: isPreview)
		configure()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		configure()
	}
	
	override func updateLayer() {
		self.layer?.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
	}
	
	// MARK: - Lifecycle
	override func draw(_ rect: NSRect) {
		super.draw(rect)
		updateTime()
		
		hour.fitTextToBounds()
		minute.font = hour.font
		timeSeparator.font = hour.font
		hourExtend.font = hour.font
		date.font = NSFont.systemFont(ofSize: hour.font!.pointSize / 3)
		
		hour.layer?.masksToBounds = false
		minute.layer?.masksToBounds = false
		
	}
	
	override func animateOneFrame() {
		super.animateOneFrame()
		updateTime()
	}
	
	func updateTime() {
		let current = Helper.Current.self
		
		hour.stringValue = hourString
		minute.stringValue = current.minute
		hourExtend.stringValue = current.ampm
		date.stringValue = "\(current.dayOfWeek) \(current.month) \(current.day), \(current.year)"
		
		let radius = Helper.randowFloat
		let offset = Helper.randowSize
		animateLabel(hour, offset, radius)
		animateLabel(minute, offset, radius)
		animateLabel(hourExtend, offset, radius)
		animateLabel(timeSeparator, offset, radius)
		animateLabel(date, offset, radius)
	}
	
	func animateLabel(_ label: NSLabel, _ offset: NSSize, _ radius: CGFloat) {
		label.layer?.shadowOpacity = 1.0
		label.layer?.shadowRadius = radius
		label.layer?.shadowColor = Helper.randomCGColor
		label.layer?.shadowOffset = offset
	}
}

extension MyCustomScreenSaver {
	func configure() {
		wantsLayer = true
		animationTimeInterval = Constants.updateInterval
		
		addSubviews()
		addContraints()
	}
	
	func addSubviews() {
		timeStackView.addArrangedSubview(hour)
		timeStackView.addArrangedSubview(timeSeparator)
		timeStackView.addArrangedSubview(minute)
		if timeStyle == .hour12 {
			timeStackView.addArrangedSubview(hourExtend)
		}

		addSubview(timeStackView)
		addSubview(date)
	}
	
	func addContraints() {
		timeStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		timeStackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

		_ = [hour, minute].map{
			$0.heightAnchor.constraint(equalTo: $0.widthAnchor, multiplier: 3/4).isActive = true
			$0.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2).isActive = true
		}
		date.trailingAnchor.constraint(equalTo: timeStackView.trailingAnchor).isActive = true
		date.bottomAnchor.constraint(equalTo: timeStackView.topAnchor).isActive = true
	}
}
