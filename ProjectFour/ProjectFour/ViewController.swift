//
//  ViewController.swift
//  ProjectFour
//
//  Created by sanjeev on 28/04/21.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

	private var webView: WKWebView!
	private var progressView: UIProgressView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
		let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
		let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
		progressView = UIProgressView(progressViewStyle: .default)
		progressView.sizeToFit()
		let progressButton = UIBarButtonItem(customView: progressView)
		toolbarItems = [progressButton, spacer, refresh]
		navigationController?.isToolbarHidden = false
		
		webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
		
		let url = URL(string: "https://www.google.com")!
		webView.load(URLRequest(url: url))
		webView.allowsBackForwardNavigationGestures = true
	}

	override func loadView() {
		webView = WKWebView()
		webView.navigationDelegate = self
		view = webView
	}
	
	override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
		if keyPath == "estimatedProgress" {
			self.progressView.progress = Float(self.webView.estimatedProgress)
		}
	}
	
	@objc func openTapped() {
		let alertController = UIAlertController(title: "Open page...", message: nil, preferredStyle: .actionSheet)
		alertController.addAction(UIAlertAction(title: "apple.com", style: .default, handler: openPage))
		alertController.addAction(UIAlertAction(title: "google.com", style: .default, handler: openPage))
		alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
		alertController.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
		present(alertController, animated: true, completion: nil)
	}
	
	func openPage(action: UIAlertAction) {
		let url = URL(string: "https://" + (action.title ?? ""))!
		webView.load(URLRequest(url: url))
	}
	
	func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
		title = webView.title
	}
	
}

