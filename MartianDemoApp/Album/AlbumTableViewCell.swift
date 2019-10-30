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
	private var album: [Album]?

    // MARK: - LifeCycle
    override func awakeFromNib() {
		super.awakeFromNib()
	}

	override func prepareForReuse() {
		super.prepareForReuse()
		self.textLabel?.text = nil
	}

	// MARK: - Configuration
	internal func configure(with album: [Album]?) {
		self.album = album
		self.textLabel?.text = "test aaaaaa"
		//_ = album?.map {
			//self.textLabel?.text = $0.title
		//}
	}

	internal func configure(with selectionHandler: AlbumSelectionHandler?) {
		self.selectionHandler = selectionHandler
	}

}

protocol AlbumSelectionProtocol {

    func configure(with selectionHandler: AlbumSelectionHandler?)
}


