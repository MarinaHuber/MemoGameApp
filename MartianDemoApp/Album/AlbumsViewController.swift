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
			guard albumsLoaded != nil else { return }
			self.setDateSource(with: albumsLoaded)
			
		})
	}
    // MARK: - Setup
    private func setDateSource(with album: [Album]) {

		self.dataSource = AlbumsViewControllerDataSource(with: album, tableView: self.tableView)

        self.reloadTableUIAnimate()
    }

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
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

