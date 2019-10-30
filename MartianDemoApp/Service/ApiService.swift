//
//  ApiService.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 10/29/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Alamofire


public enum APIServiceRouter: URLRequestConvertible {

	//change and add path to uri
	static let BASE_URL = "https://demo.martian.agency/api"
	static let header_KEY = "bWFydGlhbmFuZG1hY2hpbmU="

	case albums(HTTPMethod)
	case photosByAlbumID(Int, HTTPMethod)

	public func asURLRequest() throws -> URLRequest {
		var request = URLRequest(url: self.url!)
		request.httpMethod = self.method.rawValue
		request.addValue(APIServiceRouter.header_KEY, forHTTPHeaderField: "x-auth")
		return request
	}
//	// in case addition CRUD & Authorization a secret token
	var method: HTTPMethod {
		switch self {
		case .albums(let method):
			return method
		case .photosByAlbumID(_, let method):
			return method
		}
	}

	 var path : String {
		switch self {
		case .albums:
			return ("\(APIServiceRouter.BASE_URL)/albums")
		case .photosByAlbumID (let albumID):
			return ("\(APIServiceRouter.BASE_URL)/photos?albumId=\(albumID)")
		}
	}
	var url: URL? {
		let components = URLComponents(string: path)!
		return components.url
	}

}
