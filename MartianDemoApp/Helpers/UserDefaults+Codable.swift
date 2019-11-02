//
//  UserDefaults+Codable.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 11/1/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation

extension UserDefaults {
	private static let imagesKey = "images"
	
	var images: [Photo] {
		get {
			let decoder = JSONDecoder()
			if let data = value(forKey: UserDefaults.imagesKey) as? Data,
				let images = try? decoder.decode([Photo].self, from: data) {
				return images
			}
			return[]
		}
		
		set(images) {
			let encoder = JSONEncoder()
			if let data = try? encoder.encode(images) {
				set(data, forKey: UserDefaults.imagesKey)
			}
		}
	}
}
