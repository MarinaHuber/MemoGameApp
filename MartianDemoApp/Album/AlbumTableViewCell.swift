//
//  AlbumTableViewCell.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 10/30/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

typealias SelectionHandler = ([Album]?) -> Void

class AlbumTableViewCell: UITableViewCell, AlbumSelectionProtocol {
	
	// MARK: - Properties
	private var selectionHandler: SelectionHandler?
	private var albums: [Album]?

	// MARK: - LifeCycle
	override func awakeFromNib() {
		super.awakeFromNib()
		textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
		textLabel?.numberOfLines = 0
		textLabel?.sizeToFit()
		let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapAlbum))
		self.contentView.addGestureRecognizer(tapRecognizer)

	}

	override func prepareForReuse() {
		super.prepareForReuse()
		textLabel?.text = nil
	}

	@objc func tapAlbum() {
		if let albums = self.albums {
			self.selectionHandler?(albums)
		}
	}

	// MARK: - Configuration for data injection
	internal func configure(with album: [Album]?) {
		self.albums = album
		albums?.forEach {
			self.textLabel?.text = $0.title
		}
	}

	internal func configure(with selectionHandler: SelectionHandler?) {
		self.selectionHandler = selectionHandler
	}
}
// MARK: - Configuration protocol for navigation
protocol AlbumSelectionProtocol {
	func configure(with selectionHandler: SelectionHandler?)
}
