//
//  DetailInterfaceController.swift
//  Project1 WatchKit Extension
//
//  Created by Chad Rutherford on 8/12/20.
//

import WatchKit

class DetailInterfaceController: WKInterfaceController {
	
	@IBOutlet weak var textLabel: WKInterfaceLabel!
	
	override func awake(withContext context: Any?) {
		if let contextDictionary = context as? [String: String] {
			textLabel.setText(contextDictionary["note"] ?? "")
			let index = contextDictionary["index"] ?? "1"
			setTitle("Note \(index)")
		}
	}
}
