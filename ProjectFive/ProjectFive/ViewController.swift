//
//  ViewController.swift
//  ProjectFive
//
//  Created by sanjeev on 08/05/21.
//

import UIKit

class ViewController: UITableViewController {

	var allWords = [String]()
	var usedWords = [String]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
		
		if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
			if let startWords = try? String(contentsOf: startWordsURL) {
				allWords = startWords.components(separatedBy: "\n")
			}
		}
		
		if allWords.isEmpty {
			allWords = ["silkworm"]
		}
		
		startGame()
	}
	
	func startGame() {
		title = allWords.randomElement()
		usedWords.removeAll(keepingCapacity: true)
		tableView.reloadData()
	}
	
	func submit(_ answer: String) {
		let answerLowerCased = answer.lowercased()
		var errorTitle: String = ""
		var errorDescription: String = ""
		if (isPossible(word: answerLowerCased)) {
			if (isOriginal(word: answerLowerCased)) {
				if (isReal(word: answerLowerCased)) {
					usedWords.insert(answer, at: 0)
					let indexPath = IndexPath(row: 0, section: 0)
					tableView.insertRows(at: [indexPath], with: .automatic)
					return
				} else {
					errorTitle = "Word not recognised"
					errorDescription = "You can't just make them up, you know!"
				}
			} else {
				errorTitle = "Word used already"
				errorDescription = "Be more original!"
			}
		} else {
			guard let title = title?.lowercased() else { return }
			errorTitle = "Word not possible"
			errorDescription = "You can't spell that word from \(title)"
		}
		
		let alertController = UIAlertController(title: errorTitle, message: errorDescription, preferredStyle: .alert)
		alertController.addAction(UIAlertAction(title: "OKAY", style: .default))
		present(alertController, animated: true)
	}
	
	func isPossible(word: String) -> Bool {
		guard var tempWord = title?.lowercased() else { return false }
		for letter in word {
			if let position = tempWord.firstIndex(of: letter) {
				tempWord.remove(at: position)
			} else {
				return false
			}
		}
		return true
	}
	
	func isOriginal(word: String) -> Bool {
		return !usedWords.contains(word)
	}

	func isReal(word: String) -> Bool {
		let checker = UITextChecker()
		let range = NSRange(location: 0, length: word.utf16.count)
		let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
		return misspelledRange.location == NSNotFound
	}
 
	@objc func promptForAnswer() {
		let alertController = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .alert)
		let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self, weak alertController] action in
			guard let answer = alertController?.textFields?[0].text else { return }
			self?.submit(answer)
		}
		alertController.addAction(submitAction)
		present(alertController, animated: true)
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
		cell.textLabel?.text = usedWords[indexPath.row]
		return cell
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return usedWords.count
	}
	
}
