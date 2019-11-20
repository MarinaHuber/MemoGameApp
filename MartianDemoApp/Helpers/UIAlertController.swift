//
//  UIAlertView.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 11/20/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

public extension UIViewController {

	func presentAlert(message: String, title: String) {
		DispatchQueue.main.async {
			let alertController = UIAlertController(title: title, message:   message, preferredStyle: .alert)
			let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
			alertController.addAction(OKAction)
			self.present(alertController, animated: true)
		}

	}
}
