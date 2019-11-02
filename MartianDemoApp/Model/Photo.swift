//
//  Photo.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 10/29/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation

// MARK: - Photo Codable & UserDefaults
struct Photo: Codable {
    let albumID, id: Int?
	var url: String?
	var isBookmarked: Bool = false

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id
		case url
    }
}
