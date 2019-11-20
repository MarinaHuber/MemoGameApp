//
//  ViewController.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 10/30/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

class AlbumsViewController: UIViewController {

	// MARK: - Properties
	private var dataSource: AlbumsViewControllerDataSource?
	@IBOutlet weak var tableView: UITableView!

	// MARK: - LifeCycle
	override func viewDidLoad() {
		super.viewDidLoad()
		loadAlbums()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.reloadTableUIAnimate()
	}

	// MARK: - Setup
	func loadAlbums() {
		Service.request(router: FeedRouter.getAlbums) { (result: Result<[Album], Error>) in
			switch result {
			case .success:
				_ = result.map { self.setDateSource(with: $0) }

				self.reloadTableUIAnimate()
			case .failure:
				print(result)
			}
		}
	}

	private func setDateSource(with albums: [Album]) {
		self.dataSource = AlbumsViewControllerDataSource(with: albums, tableView: self.tableView, selectionHandler: { [weak self] (albums) in
			self?.showPhotosViewController(with: albums)
		})
	}

	// MARK: - Reload UI
	private func reloadTableUIAnimate() {
		DispatchQueue.main.async(execute: { () -> Void in
			self.tableView.reloadData()
			let visibleInexPaths = self.tableView.indexPathsForVisibleRows

			_ = visibleInexPaths.map {

				$0.map {
					let cell = self.tableView.cellForRow(at: $0)
					cell?.animateStart(0.9, delay: Double($0.row) * 0.02, completion: {
						completed in
					})
				}
			}
		})
	}

	// MARK: - Helper
	private func showPhotosViewController(with albums: [Album]?) {
		guard let albums = albums else {
			return
		}
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let vc = storyboard.instantiateViewController(withIdentifier: "PhotosViewController") as? PhotosViewController ?? PhotosViewController()
		vc.configure(with: albums)
		self.navigationController?.pushViewController(vc, animated: true)
		albums.forEach {
			guard let id = $0.id else { return }
			_ = id
		}
	}
}

extension UINavigationController {
   open override var preferredStatusBarStyle: UIStatusBarStyle {
      return navigationController?.preferredStatusBarStyle ?? .lightContent
   }
}
