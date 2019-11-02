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
		UINavigationBar.appearance().backgroundColor = .clear
		UINavigationBar.appearance().barTintColor = .clear
		UINavigationBar.appearance().tintColor = .black
		UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
		UINavigationBar.appearance().shadowImage = UIImage()
		UINavigationBar.appearance().layer.shadowColor = UIColor.clear.cgColor
	}
}


