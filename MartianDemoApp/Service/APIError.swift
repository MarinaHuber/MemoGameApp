//
//  APIError.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 11/20/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation

enum APIError: Error {
    case requestFailed
    case invalidData
    case jsonParsingFailure
    var localizedDescription: String {
        switch self {
        case .requestFailed: return "Request Failed"
        case .invalidData: return "Invalid Data"
        case .jsonParsingFailure: return "JSON Parsing Failure"
        }
    }
}
