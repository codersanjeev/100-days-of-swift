//
//  ViewController.swift
//  ProjectTwo
//
//  Created by sanjeev on 15/04/21.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet var buttonOne: UIButton!
	@IBOutlet var buttonTwo: UIButton!
	@IBOutlet var buttonThree: UIButton!
	
	private var countries: [String] = []
	private var score = 0
	private var correctAnswer = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		[buttonOne, buttonTwo, buttonThree].forEach {
			$0?.layer.borderWidth = 1
			$0?.layer.borderColor = UIColor.lightGray.cgColor
		}
		countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
		askQuestion(action: nil)
	}

	private func askQuestion(action: UIAlertAction!) {
		countries.shuffle()
		buttonOne.setImage(UIImage(named: countries[0]), for: .normal)
		buttonTwo.setImage(UIImage(named: countries[1]), for: .normal)
		buttonThree.setImage(UIImage(named: countries[2]), for: .normal)
		correctAnswer = Int.random(in: 0...2)
		title = countries[correctAnswer].uppercased()
	}

	@IBAction func buttonTapped(_ sender: UIButton) {
		var title: String
		if (sender.tag == correctAnswer) {
			title = "Correct"
			score += 1
		} else {
			title = "Wrong"
			score -= 1
		}
		let alertController = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
		alertController.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
		present(alertController, animated: true, completion: nil)
	}
}

