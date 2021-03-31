//
//  ViewController.swift
//  ProjectOne
//
//  Created by sanjeev on 31/03/21.
//

import UIKit

class ViewController: UITableViewController {
	
	private var pictures = [String]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let fileManager = FileManager.default
		guard let path = Bundle.main.resourcePath else { return }
		let items = try! fileManager.contentsOfDirectory(atPath: path)
		items.forEach { item in
			if (item.hasPrefix("nssl")) {
				pictures.append(item)
			}
		}
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return pictures.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
		cell.textLabel?.text = pictures[indexPath.row]
		return cell
	}
	
}

