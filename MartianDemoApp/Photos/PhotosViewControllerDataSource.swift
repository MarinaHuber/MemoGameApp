//
//  PhotosViewControllerDataSource.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 10/29/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

class PhotosViewControllerDataSource: NSObject {

	// MARK: - Properties
	private var photosList: [Photo] = []

	// MARK: - Init
	init(with photosList: [Photo], collectionView: UICollectionView) {
		super.init()
		self.photosList = photosList
		collectionView.dataSource = self
	}
}

// MARK: - DataSource
extension PhotosViewControllerDataSource: UICollectionViewDataSource {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		self.photosList.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let photo = self.photosList.item(at: indexPath.row) else {
            return UICollectionViewCell()
        }
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? PhotoCollectionViewCell ?? PhotoCollectionViewCell()
		if let imageString = photo.url {
		 let urlObject = URL(string: imageString)
			cell.collectionImageView?.af_setImage(withURL: urlObject!,
											  placeholderImage: nil,
											  imageTransition: UIImageView.ImageTransition.crossDissolve(0.3),
											  runImageTransitionIfCached: true,
											  completion: nil)
		}
//		let exists = AlbumRealm.isAlbumSavedById(photo.albumID!)
//
//		let newImage = exists ? UIImage(named: "bookmarked") :
//		UIImage(named: "un_bookmark")
//		cell.bookmark.setImage(newImage, for: .normal)
		return cell
	}
}

// MARK: - Layout Cell
extension PhotosViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		return CGSize(width: 90, height: 70)
	}
}
