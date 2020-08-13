//
//  InterfaceController.swift
//  Project3 WatchKit Extension
//
//  Created by Chad Rutherford on 8/13/20.
//

import WatchKit
import Foundation


// 9f3c490c82ee4e40832bfd05b9db84bf

class InterfaceController: WKInterfaceController {

	@IBOutlet var amountLabel: WKInterfaceLabel!
	@IBOutlet var amountSlider: WKInterfaceSlider!
	@IBOutlet var currencyPicker: WKInterfacePicker!
	
	override func awake(withContext context: Any?) {
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
	
	@IBAction func amountChanged(_ value: Float) {
		
	}
	
	@IBAction func convertTapped() {
		
	}
	
	@IBAction func baseCurrencyChanged(_ value: Int) {
		
	}
}
