//
//  DetailViewController.swift
//  ProjectOne
//
//  Created by sanjeev on 03/04/21.
//

import UIKit

class DetailViewController: UIViewController {
	@IBOutlet var imageView: UIImageView!
	var selectedImage: String?
	
	override func viewDidLoad() {
        super.viewDidLoad()
		title = selectedImage
		if let selectedImage = selectedImage {
			imageView.image = UIImage(named: selectedImage)
		}
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.hidesBarsOnTap = true
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		navigationController?.hidesBarsOnTap = false
		super.viewWillDisappear(animated)
	}
}
