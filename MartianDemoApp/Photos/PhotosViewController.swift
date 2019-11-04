//
//  PhotosViewController.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 10/30/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
	
	// MARK: - Properties
	@IBOutlet weak var photoCollectionView: UICollectionView!
	private var dataSource: PhotosViewControllerDataSource?
	private var albums: [Album]? = []
	private var albumID: Int?

	// MARK: - LifeCycle
	override func viewDidLoad() {
		super.viewDidLoad()
		photoCollectionView.delegate = self
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(showNextVC))
		loadPhotos()
	}
	
	override func viewWillLayoutSubviews() {
		photoCollectionView.layoutIfNeeded()
	}

	@objc func loadPhotos() {
		albums?.forEach {
			guard let albumID = $0.id else { return }
			NetworkApi.getPhotosByAlbumID(albumID, completionHandler: {
				photosLoaded, error in
				self.setDateSource(with: photosLoaded)
				self.photoCollectionView.reloadData()
			})
		}
	}
	
	private func setDateSource(with photos: [Photo]) {
		self.dataSource = PhotosViewControllerDataSource(with: photos, collectionView: self.photoCollectionView)
	}
		
	// MARK: - Helper navigation
	func configure(with albums: [Album]) {
		self.albums = albums
	}
	
	@objc private func showNextVC() {
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let vc = storyboard.instantiateViewController(withIdentifier: "SavePhotoViewController") as? SavePhotoViewController ?? SavePhotoViewController()
		self.navigationController?.pushViewController(vc, animated: true)
	}
}
