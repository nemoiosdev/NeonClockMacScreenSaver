//
//  Helper.swift
//  MyCustomScreenSaver
//
//  Created by NgocThai on 9/22/20.
//

import ScreenSaver

class Helper {
	// MARK: - Private instances
	private static var formatter = DateFormatter()
	
	class Current {
		static var year: String {
			formatter.dateFormat = "yyyy"
			return formatter.string(from: Date())
		}
		
		static var month: String {
			formatter.dateFormat = "MMM"
			return formatter.string(from: Date())
		}
		
		static var day: String {
			formatter.dateFormat = "dd"
			return formatter.string(from: Date())
		}
		
		static var dayOfWeek: String {
			formatter.dateFormat = "E"
			return formatter.string(from: Date())
		}
		
		static var hour12: String {
			formatter.dateFormat = "h"
			return formatter.string(from: Date())
		}
		
		static var hour24: String {
			return String(Calendar.current.component(.hour, from: Date()))
		}
		
		static var minute: String {
			formatter.dateFormat = "mm"
			return formatter.string(from: Date())
		}
		
		static var second: String {
			formatter.dateFormat = "ss"
			return formatter.string(from: Date())
		}
		
		static var ampm: String {
			formatter.dateFormat = "a"
			return formatter.string(from: Date())
		}
	}
	
	static var randowFloat: CGFloat {
		return SSRandomFloatBetween(Constants.effect - 2 , Constants.effect)
	}
	
	static var randomCGColor: CGColor {
		return CGColor(red: SSRandomFloatBetween(0, 1),
					   green: SSRandomFloatBetween(0, 1),
					   blue: SSRandomFloatBetween(0, 1), alpha: 1.0)
	}
	
	static var randowSize: NSSize {
		return NSSize(width: SSRandomFloatBetween(-1 * Constants.size, Constants.size),
					  height: SSRandomFloatBetween(-1 * Constants.size, Constants.size))
	}
}
