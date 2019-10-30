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
	static let BASE_URL = "https://demo.martian.agency/api/albums"
	static let header_KEY = "bWFydGlhbmFuZG1hY2hpbmU="

	case albums(HTTPMethod)
	case photosByAlbumID(Int, HTTPMethod)

	public func asURLRequest() throws -> URLRequest {
		var request = URLRequest(url: self.url!)
		request.httpMethod = self.method.rawValue.uppercased()
		request.addValue(APIServiceRouter.header_KEY, forHTTPHeaderField: "x-auth")
		return request
	}
//	// in case addition CRUD & Authorization a secret token
	var method: HTTPMethod {
		switch self {
		case .albums(let method): return method
		case .photosByAlbumID(_, let method): return method
		}
	}

	var url: URL? {
		let components = URLComponents(string: APIServiceRouter.BASE_URL)!
		return components.url
	}

}
