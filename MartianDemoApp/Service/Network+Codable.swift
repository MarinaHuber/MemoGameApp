//
//  Network+Codable.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 10/29/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Alamofire

class NetworkApi {

	public static func getAlbums(completionHandler: @escaping (_ result: [Album], Error?) -> Void) {
		let request = APIServiceRouter.albums
		Alamofire.request(request).responseJSON { (response) in
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
		let request = APIServiceRouter.photosByAlbumID(albumID)
		Alamofire.request(request).responseJSON { (response) in
			guard let data = response.data else { return }
			//debugPrint(response)

			do {
				let decoder = JSONDecoder()
				let photosDecoded = try decoder.decode([Photo].self, from: data)
				completionHandler(photosDecoded, nil)

			} catch let error {
				completionHandler ([], error as NSError?)
			}
		}.resume()
	}

	public static func getDataFromUrl(url: URL, completionHandler: @escaping (Data?, Error?) -> ()) {
		//Nil error albums do not have image:String need to get data for photo
		let request = APIServiceRouter.albums
		Alamofire.request(request).responseData { (response) in
			guard let data = response.data else { return }
					completionHandler(data, nil)

				}.resume()

//		URLSession.shared.dataTask(with: url) { data, response, error in
//			completion(data, response, error)
//		}.resume()
	}
}
