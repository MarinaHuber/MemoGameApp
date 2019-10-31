//
//  AlbumTableViewCell.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 10/29/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

typealias AlbumSelectionHandler = ([Album]?) -> Void

class AlbumTableViewCell: UITableViewCell, AlbumSelectionProtocol {
	// MARK: - Properties
	private var selectionHandler: AlbumSelectionHandler?
	private var albums: [Album]?

    // MARK: - LifeCycle
    override func awakeFromNib() {
		super.awakeFromNib()
		textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
		textLabel?.numberOfLines = 0

	}

	override func prepareForReuse() {
		super.prepareForReuse()
		textLabel?.text = nil
	}

	// MARK: - Configuration
	internal func configure(with album: [Album]?) {
		self.albums = album
		albums?.forEach {
			self.textLabel?.text = $0.title
		}
	}

	internal func configure(with selectionHandler: AlbumSelectionHandler?) {
		self.selectionHandler = selectionHandler
	}

}

protocol AlbumSelectionProtocol {
    func configure(with selectionHandler: AlbumSelectionHandler?)
}




