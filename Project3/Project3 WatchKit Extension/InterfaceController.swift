//
//  InterfaceController.swift
//  Project3 WatchKit Extension
//
//  Created by Chad Rutherford on 8/13/20.
//

import WatchKit
import Foundation


// 9f3c490c82ee4e40832bfd05b9db84bf
enum Currencies: String, CaseIterable {
	case usd = "USD"
	case aud = "AUD"
	case cad = "CAD"
	case chf = "CHF"
	case cny = "CNY"
	case eur = "EUR"
	case gbp = "GBP"
	case hkd = "HKD"
	case jpy = "JPY"
	case sgd = "SGD"
}

class InterfaceController: WKInterfaceController {

	@IBOutlet var amountLabel: WKInterfaceLabel!
	@IBOutlet var amountSlider: WKInterfaceSlider!
	@IBOutlet var currencyPicker: WKInterfacePicker!
	
	static let defaultCurrencies = ["USD", "EUR"]
	var currentCurrency: Currencies = .usd
	var currentAmount = 500
	
	override func awake(withContext context: Any?) {
        var items = [WKPickerItem]()
		for currency in Currencies.allCases {
			let item = WKPickerItem()
			item.title = currency.rawValue
			items.append(item)
		}
		currencyPicker.setItems(items)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
	
	@IBAction func amountChanged(_ value: Float) {
		currentAmount = Int(value)
		amountLabel.setText(String(currentAmount))
	}
	
	@IBAction func convertTapped() {
		
	}
	
	@IBAction func baseCurrencyChanged(_ value: Int) {
		currentCurrency = Currencies.allCases[value]
	}
}
