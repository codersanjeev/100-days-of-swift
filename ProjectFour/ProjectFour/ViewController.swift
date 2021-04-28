//
//  ViewController.swift
//  ProjectFour
//
//  Created by sanjeev on 28/04/21.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

	var webView: WKWebView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let url = URL(string: "https://www.google.com")!
		webView.load(URLRequest(url: url))
		webView.allowsBackForwardNavigationGestures = true
	}

	override func loadView() {
		webView = WKWebView()
		webView.navigationDelegate = self
		view = webView
	}
	
}

