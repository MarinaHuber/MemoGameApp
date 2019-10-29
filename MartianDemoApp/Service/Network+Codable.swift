//
//  Network+Codable.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 10/29/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Alamofire

class NetworkApi {
//
//	private var header: HTTPHeaders = [
//		"x-auth": "bWFydGlhbmFuZG1hY2hpbmU="
//	]

	public static func getAlbums(_ albumID: String, completionHandler: @escaping (_ result: Array<Album>?, Error?) -> Void) {
		let request = APIServiceRouter.albums(albumID, .get)
		Alamofire.request(request).responseJSON { (response) in
			debugPrint(response)
//			guard let data = response.data else { return }
//
//			do {
//				let decoder = JSONDecoder()
//				let albumDecoded = try decoder.decode(Album.self, from: data)
//				let albums = albumDecoded.topalbums?.albumArray
//				for album in albums! {
//					print(album.name ?? "")
//				completionHandler(albums!, nil)
//
//			} catch {
//				completionHandler ([], error as NSError?)
//			}
			}.resume()
	}
}
