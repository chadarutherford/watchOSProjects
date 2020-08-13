//
//  InterfaceController.swift
//  Project2 WatchKit Extension
//
//  Created by Chad Rutherford on 8/13/20.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

	@IBOutlet weak var question: WKInterfaceImage!
	@IBOutlet weak var answers: WKInterfaceGroup!
	@IBOutlet weak var rock: WKInterfaceButton!
	@IBOutlet weak var paper: WKInterfaceButton!
	@IBOutlet weak var scissors: WKInterfaceButton!
	@IBOutlet weak var levelCounter: WKInterfaceLabel!
	@IBOutlet weak var timer: WKInterfaceTimer!
	
	var allMoves = ["rock", "paper", "scissors"]
	var shouldWin = true
	var level = 1
	
	private func newLevel() {
		levelCounter.setText("\(level)/20")
		if Bool.random() {
			setTitle("Win!")
			shouldWin = true
		} else {
			setTitle("Lose!")
			shouldWin = false
		}
		allMoves.shuffle()
		question.setImage(UIImage(named: allMoves[0]))
	}
	
	override func awake(withContext context: Any?) {
		super.awake(withContext: context)
		rock.setBackgroundImage(UIImage(named: "rock"))
		paper.setBackgroundImage(UIImage(named: "paper"))
		scissors.setBackgroundImage(UIImage(named: "scissors"))
		timer.start()
		newLevel()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
	
	@IBAction func rockTapped() {
		
	}
	
	@IBAction func paperTapped() {
		
	}
	
	@IBAction func scissorsTapped() {
		
	}
}
