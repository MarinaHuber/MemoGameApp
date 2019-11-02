//
//  ApiService.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 10/29/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Alamofire

public enum APIServiceRouter: URLRequestConvertible {

	static let BASE_URL = "https://demo.martian.agency/api"
	static let header_KEY = "bWFydGlhbmFuZG1hY2hpbmU="

	case albums
	case photosByAlbumID(Int)

	public func asURLRequest() throws -> URLRequest {
		var request = URLRequest(url: url.appendingPathComponent(self.path))
		request.addValue(APIServiceRouter.header_KEY, forHTTPHeaderField: "x-auth")
		return request
	}
	var path : String {
		switch self {
		case .albums:
			return ("/albums")
		case .photosByAlbumID (let albumID):
			return ("/albums/\(albumID)/photos")
		}
	}
	var url: URL {
		let components = URLComponents(string: APIServiceRouter.BASE_URL)
		return (components?.url)!
	}

}
