//
//  Router.swift
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation


enum FeedRouter {

	case getAlbums
	case getImagesByAlbumId(Int)

	var scheme: String {
	  switch self {
	  case .getAlbums, .getImagesByAlbumId(_):
		return "https"
	  }
	}

	// 3.
	var host: String {
	  switch self {
	  case .getAlbums, .getImagesByAlbumId(_):
		return "demo.martian.agency"
	  }
	}

	var path : String {
		switch self {
		case .getAlbums:
			return "/api/albums"
		case .getImagesByAlbumId(let albumId):
			return "/api/albums/\(albumId)/photos"
		}
	}
	var method: String {
	  switch self {
		case .getAlbums, .getImagesByAlbumId(_):
		  return "GET"
	  }
	}
}
