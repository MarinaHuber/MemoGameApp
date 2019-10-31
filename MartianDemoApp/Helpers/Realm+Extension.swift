//
//  Realm+Extension.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 10/31/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Realm
import RealmSwift


extension AlbumRealm {

static func saveAllAlbums(in realm: Realm = try! Realm()) -> [AlbumRealm] {
	return Array(realm.objects(AlbumRealm.self))
	}

static func isAlbumSavedById(_ albumID: Int) -> Bool {
	guard albumID == 0 else {
	let savedID = myRealm.objects(AlbumRealm.self).filter("id = \(albumID)")
	 return savedID.count > 0
	  }
	return false
	}


}

