//
//  ViewController.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 10/29/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit
import  RealmSwift

class AlbumsViewController: UIViewController {

	private var dataSource: AlbumsViewControllerDataSource?
	@IBOutlet weak var tableView: UITableView!
	private var albumsList: [Album] = []

	override func viewDidLoad() {
		super.viewDidLoad()
		loadAlbums()
	}
	func loadAlbums() {
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
		self.reloadTableUIAnimate()
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


	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		super.prepare(for: segue, sender: sender)
		if let indexPath = self.tableView.indexPathForSelectedRow, segue.identifier == "photoSegue" {
				let albumElement = self.albumsList.item(at: indexPath.row)
				let vc = segue.destination as! PhotosViewController
				vc.albumID = albumElement?.id
		}

	}


}

