//
//  APIError.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 11/20/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation

enum APIError: Error {
    case parametersNil
    case decodingFailed
    case missingURL
    var localizedDescription: String {
        switch self {
        case .parametersNil: return "Parameters were nil"
        case .decodingFailed: return "Parameter encoding fai;ed"
        case .missingURL: return "URL is nil"
        }
    }
}
