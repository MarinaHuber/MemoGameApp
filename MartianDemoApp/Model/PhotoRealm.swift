//
//  PhotoRealm.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 10/29/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import RealmSwift

// MARK: - PhotoModelRealm

class PhotoList: Object {
   let photoListItems = RealmSwift.List<PhotoRealm>()
}
class PhotoRealm: Object {
	dynamic var albumID = 0
	dynamic var id = 0
	let url = ""
	var photoData: NSData? = nil

	override static func primaryKey() -> String? {
		return "id"
	}
}
