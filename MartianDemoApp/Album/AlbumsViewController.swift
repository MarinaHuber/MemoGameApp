//
//  ViewController.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 10/29/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

class AlbumsViewController: UIViewController {

	private var dataSource: AlbumsViewControllerDataSource?
	@IBOutlet weak var tableView: UITableView!

	override func viewDidLoad() {
		super.viewDidLoad()
		showAlbums()
	}
	func showAlbums() {
		NetworkApi.getAlbums(completionHandler: {
			albumsLoaded, error in
			self.setDateSource(with: albumsLoaded)
			self.reloadTableUIAnimate()
			
		})
	}
    // MARK: - Setup
    private func setDateSource(with albums: [Album]) {
		self.dataSource = AlbumsViewControllerDataSource(with: albums, tableView: self.tableView)
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.tableView.reloadData()
	}

	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
	}

	private func reloadTableUIAnimate() {

		DispatchQueue.main.async(execute: { () -> Void in
			self.tableView.reloadData()
			let visibleInexPaths = self.tableView.indexPathsForVisibleRows

			_ = visibleInexPaths.map {

				$0.map {
					let cell = self.tableView.cellForRow(at: $0)
					cell?.animateStart(0.8, delay: Double($0.row) * 0.03, completion: {
						completed in

					})

				}
			}

		})

	}
}

