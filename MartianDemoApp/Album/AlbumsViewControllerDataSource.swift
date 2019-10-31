//
//  AlbumsViewControllerDataSource.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 10/29/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

class AlbumsViewControllerDataSource: NSObject {

// MARK: - Properties
	private var albumsList: [Album] = []
	private var selectedAlbum: Album?

// MARK: - Init
	init(with albumsList: [Album], tableView: UITableView) {
		super.init()
		self.albumsList = albumsList
		tableView.delegate = self
		tableView.dataSource = self
		tableView.rowHeight = UITableView.automaticDimension
	}
}
// MARK: - DataSource
extension AlbumsViewControllerDataSource: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.albumsList.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let albumElement = self.albumsList.item(at: indexPath.row) else {
            return UITableViewCell()
        }
		let cell = tableView.dequeueReusableCell(withIdentifier: "albumCell", for: indexPath) as? AlbumTableViewCell ?? AlbumTableViewCell()
		cell.configure(with: [albumElement])
		return cell
	}

}

// MARK: - Delegate
extension AlbumsViewControllerDataSource: UITableViewDelegate {

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
	}
}


