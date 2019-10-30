//
//  PhotoRealm.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 10/29/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import RealmSwift

// MARK: - Photo
class PhotoRealm: Object {
	dynamic var albumID = 0
	dynamic var id = 0
	let url = ""

	override static func primaryKey() -> String? {
		return "id"
	}
}
