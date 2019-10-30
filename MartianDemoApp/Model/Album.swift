//
//  Album.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 10/29/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation

// MARK: - Album
struct AlbumList: Codable {
	let album: [Album]?
}
struct Album: Codable {
	let userID: Int?
	let id: Int?
    let title: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id
		case title
    }
}
