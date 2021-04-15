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
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
		if let selectedImage = selectedImage {
			imageView.image = UIImage(named: selectedImage)
		}
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.hidesBarsOnTap = true
	}
	
	@objc func shareTapped() {
		guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
			print("No image found")
			return
		}
		let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: [])
		activityViewController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
		present(activityViewController, animated: true, completion: nil)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		navigationController?.hidesBarsOnTap = false
		super.viewWillDisappear(animated)
	}
}
