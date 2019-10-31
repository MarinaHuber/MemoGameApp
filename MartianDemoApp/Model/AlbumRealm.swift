//
//  AlbumRealm.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 10/31/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import RealmSwift

// MARK: - Photo
class AlbumRealm: Object {
	dynamic var id = Int()
	let title = String()

	override static func primaryKey() -> String? {
		return "id"
	}
}
