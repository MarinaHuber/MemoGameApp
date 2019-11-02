//
//  AlbumsViewControllerDataSource.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 10/30/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

class AlbumsViewControllerDataSource: NSObject {
	
	// MARK: - Properties
	private var selection: SelectionHandler?
	private var albumsList: [Album] = []
	private var selectedAlbum: Album?
	
	// MARK: - Init for dependency injection
	init(with albumsList: [Album], tableView: UITableView, selectionHandler: SelectionHandler?) {
		super.init()
		self.albumsList = albumsList
		self.selection = selectionHandler
		tableView.dataSource = self
		tableView.rowHeight = UITableView.automaticDimension
	}
}

// MARK: - DataSource required
extension AlbumsViewControllerDataSource: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.albumsList.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let albumElement = self.albumsList.item(at: indexPath.row) else {
			return UITableViewCell()
		}
		let cell = tableView.dequeueReusableCell(withIdentifier: "albumCell", for: indexPath) as? AlbumTableViewCell ?? AlbumTableViewCell()
		cell.configure(with: self.selection)
		cell.configure(with: [albumElement])
		return cell
	}
}
