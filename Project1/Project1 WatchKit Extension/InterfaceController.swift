//
//  InterfaceController.swift
//  Project1 WatchKit Extension
//
//  Created by Chad Rutherford on 8/12/20.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
	
	@IBOutlet weak var table: WKInterfaceTable!
	
    override func awake(withContext context: Any?) {
		table.setNumberOfRows(10, withRowType: "Row")
		for rowIndex in 0 ..< 10 {
			guard let row = table.rowController(at: rowIndex) as? NoteSelectRow else { continue }
			row.textLabel.setText("Hello, row \(rowIndex + 1)")
		}
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
	
	@ IBAction func addNewNote() {
		
	}
}
