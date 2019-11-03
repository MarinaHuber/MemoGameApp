//
//  AppDelegate.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 10/29/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		customizeUI()
		return true
	}
}
extension AppDelegate {
	
	func customizeUI() {

		guard let navigationController = self.window?.rootViewController as? UINavigationController else { return }
		let red = UIColor(named: "RedMartian")
		let white = UIColor(named: "WhiteMartian")
		navigationController.navigationBar.backgroundColor = .clear
		navigationController.navigationBar.barTintColor = red
		navigationController.navigationBar.tintColor = white
		navigationController.navigationBar.titleTextAttributes = [.foregroundColor : white as Any]
	}
}


