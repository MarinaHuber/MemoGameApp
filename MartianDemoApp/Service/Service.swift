//
//  Service.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 11/20/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation

class Service: APIClient {

	/// Help integrate with class func
	/// - Parameters:
	///   - request: error hendle for request
	///   - decode: serialization error
	///   - completion: with Result
	internal func fetch<T>(with request: URLRequest, decode: @escaping (Decodable) -> T?, completion: @escaping (Result<T, APIError>) -> Void) where T : Decodable {
	}

	var session: URLSession
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }

    convenience init() {
        self.init(configuration: .default)
    }
   //in the signature of the function in the success case we define the Class type thats is the generic one in the API
	class func request<T: Codable>(router: FeedRouter, completion: @escaping (Result<[T], Error>) -> ()) {

		var components = URLComponents()
		components.scheme = router.scheme
		components.host = router.host
		components.path = router.path

        guard let url = components.url else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = router.method
		urlRequest.setValue("bWFydGlhbmFuZG1hY2hpbmU=", forHTTPHeaderField: "x-auth")

		let session = URLSession(configuration: .default)
		session.dataTask(with: urlRequest) { data, response, error in

			guard error == nil else {
				completion(.failure(APIError.missingURL))
				return
			}
			guard let data = data else { return }
			do {
				let decoder = JSONDecoder()
				let responseObject = try decoder.decode([T].self, from: data)
							DispatchQueue.main.async {
					completion(.success(responseObject))
				}

			} catch _ {
				completion (.failure(APIError.decodingFailed))
			}

		}.resume()
	}

	class func getDataFromUrl(url: URL, completion: @escaping (Data?, Error?) -> ()) {
		URLSession.shared.dataTask(with: url) { data, response, error in
			completion(data, error)
		}.resume()
	}
}
