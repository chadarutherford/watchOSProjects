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
	
	var notes = [String]()
	var savePath = InterfaceController.getDocumentsDirectory()?.appendingPathComponent("notes")
	
    override func awake(withContext context: Any?) {
		do {
			guard let savePath = savePath else { return }
			let data = try Data(contentsOf: savePath)
			notes = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [String] ?? [String]()
		} catch {
			// do nothing
		}
		table.setNumberOfRows(notes.count, withRowType: "Row")
		for rowIndex in 0 ..< notes.count {
			set(row: rowIndex, to: notes[rowIndex])
		}
    }
	
	func set(row rowIndex: Int, to text: String) {
		guard let row = table.rowController(at: rowIndex) as? NoteSelectRow else { return }
		row.textLabel.setText(text)
	}
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
	
	@ IBAction func addNewNote() {
		presentTextInputController(withSuggestions: nil, allowedInputMode: .plain) { [unowned self] result in
			guard let result = result?.first as? String else { return }
			self.table.insertRows(at: IndexSet(integer: self.notes.count), withRowType: "Row")
			self.set(row: self.notes.count, to: result)
			self.notes.append(result)
			do {
				let data = try NSKeyedArchiver.archivedData(withRootObject: self.notes, requiringSecureCoding: false)
				guard let savePath = self.savePath else { return }
				try data.write(to: savePath)
			} catch {
				print("Failed to save data: \(error.localizedDescription)")
			}
		}
	}
	
	override func contextForSegue(withIdentifier segueIdentifier: String, in table: WKInterfaceTable, rowIndex: Int) -> Any? {
		return ["index": String(rowIndex + 1), "note": notes[rowIndex]]
	}
	
	static func getDocumentsDirectory() -> URL? {
		guard let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
		return path
	}
}
