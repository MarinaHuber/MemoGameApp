//
//  AlbumRealm.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 10/31/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import RealmSwift
import  Realm

// MARK: - AlbumModelRealm

class ListAlbum: Object {
   let albumListItems = RealmSwift.List<AlbumRealm>()
}
class AlbumRealm: Object {
	dynamic var id = Int()
	let title = String()

	override static func primaryKey() -> String? {
		return "id"
	}
}

//MARK: DATABASE CODE
func saveData(id: Int) -> Void {
	let obj = ListAlbum(value: id)
	let realm = try! Realm()
	try! realm.write({
		// If update = true, objects that are already in the Realm will be
		// updated instead of added a new.
		realm.add(obj, update: .all)
	})
}
func deleteData(id: Int){
	let realm = try! Realm()
	let data = realm.object(ofType: ListAlbum.self, forPrimaryKey: id)
	if data != nil{
		try! realm.write {
			realm.delete(data!)
		}
	}
}
//func getData(id: Int,completion: @escaping (_ Data: Data, _ isContain:Bool) -> Void){
//	let realm = try! Realm()
//	let data = realm.object(ofType: List.self, forPrimaryKey: id)
//	if data != nil{
//		completion((data)!, true)
//	}else{
//		completion(Data(), false)
//	}
//}
