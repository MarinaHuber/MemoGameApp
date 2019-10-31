//
//  PhotosViewController.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 10/29/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {

	@IBOutlet weak var photoCollectionView: UICollectionView!
	private var dataSource: PhotosViewControllerDataSource?
	var albumID: Int?

	override func viewDidLoad() {
		super.viewDidLoad()
		//loadPhotos()
		
	}

	override func viewWillLayoutSubviews() {
		//photoCollectionView.layoutIfNeeded()
	}

	func loadPhotos() {
		NetworkApi.getPhotosByAlbumID(4, completionHandler: {
		photosLoaded, error in
		//	self.setDateSource(with: photosLoaded)

	})
	}
    private func setDateSource(with photos: [Photo]) {
		self.dataSource = PhotosViewControllerDataSource(with: photos, collectionView: self.photoCollectionView)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

}

