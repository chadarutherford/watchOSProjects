//
//  CurrenciesInterfaceController.swift
//  Project3 WatchKit Extension
//
//  Created by Chad Rutherford on 8/13/20.
//

import WatchKit

class CurrenciesInterfaceController: WKInterfaceController {
	
	@IBOutlet var table: WKInterfaceTable!
	
	let selectedColor = UIColor.selected
	let deselectedColor = UIColor.deselected
	static let selectedCurrenciesKey: String = .selectedCurrenciesKey
	
	override func awake(withContext context: Any?) {
		super.awake(withContext: context)
		table.setNumberOfRows(Currencies.allCases.count, withRowType: .row)
		let defaults = UserDefaults.standard
		let selectedCurrencies = defaults.array(forKey: .selectedCurrenciesKey) as? [String] ?? InterfaceController.defaultCurrencies
		for (index, currency) in Currencies.allCases.enumerated() {
			guard let row = table.rowController(at: index) as? CurrencyRow else { continue }
			row.textLabel.setText(currency.rawValue)
			
			if selectedCurrencies.contains(currency.rawValue) {
				row.group.setBackgroundColor(selectedColor)
			} else {
				row.group.setBackgroundColor(deselectedColor)
			}
		}
	}
	
	override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
		guard let row = table.rowController(at: rowIndex) as? CurrencyRow else { return }
		let defaults = UserDefaults.standard
		var selectedCurrencies = defaults.array(forKey: .selectedCurrenciesKey) as? [String] ?? InterfaceController.defaultCurrencies
		let selectedCurrency = Currencies.allCases[rowIndex]
		if let index = selectedCurrencies.firstIndex(of: selectedCurrency.rawValue) {
			selectedCurrencies.remove(at: index)
			row.group.setBackgroundColor(deselectedColor)
		} else {
			selectedCurrencies.append(selectedCurrency.rawValue)
			row.group.setBackgroundColor(selectedColor)
		}
		
		defaults.set(selectedCurrencies, forKey: .selectedCurrenciesKey)
	}
}
