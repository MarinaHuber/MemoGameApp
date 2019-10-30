//
//  Network+Codable.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 10/29/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Alamofire
import AlamofireImage

enum NetworkResult<T> {
	case success(T)
	case failure(Error)

	var isSuccess: Bool {
		switch self {
		case .failure:	return false
		case .success:	return true
		}
	}
	var value: T? {
		switch self {
		case .failure:				return nil
		case .success(let value):	return value
		}
	}
}

class NetworkApi {

	public static func getAlbums(completionHandler: @escaping (_ result: [Album], Error?) -> Void) {
		let request = APIServiceRouter.albums(.get)
		Alamofire.request(request).responseJSON {
			(response) in
			debugPrint(response)
			guard let data = response.data else { return }

			do {
				let decoder = JSONDecoder()
				let albumDecoded = try decoder.decode([Album].self, from: data)
				_ = albumDecoded.filter { album in
					return album.title != nil
				}
				completionHandler(albumDecoded, nil)

			} catch let error {
			debugPrint("Error serializing json:", error)
				completionHandler([], error)
			}
			}.resume()
	}


	public static func getPhotosByAlbumID(_ albumID: Int, completionHandler: @escaping (_ result: [Photo], Error?) -> Void) {
		let request = APIServiceRouter.photosByAlbumID(albumID, .get)
		Alamofire.request(request).responseJSON { (response) in
//			guard let data = response.data else { return }
//
//			do {
//				let decoder = JSONDecoder()
//				let albumDecoded = try decoder.decode([Photo].self, from: data)
//				for photo in photos! {
//					print(album.name ?? "")
//					}
//
//				completionHandler(photos!, nil)
//
//			} catch {
//				completionHandler ([], error as NSError?)
//			}
			}.resume()
	}

}
