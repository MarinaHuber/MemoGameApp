//
//  PhotosViewControllerDataSource.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 10/30/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit
import AlamofireImage

class PhotosViewControllerDataSource: NSObject {

	// MARK: - Properties
	var photosList: [Photo]?

	// MARK: - Init for dependency injection
	init(with photosList: [Photo], collectionView: UICollectionView) {
		super.init()
		self.photosList = photosList
		collectionView.dataSource = self
	}
}

// MARK: - DataSource required
extension PhotosViewControllerDataSource: UICollectionViewDataSource {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		self.photosList?.count ?? 0
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let photo = self.photosList?.item(at: indexPath.row) else {
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
			cell.saveBlock = {
				if cell.isBookmarked == true {
					UserDefaults.standard.images.append(photo)
					UserDefaults.standard.synchronize()
					_ = UserDefaults.standard.images.map { $0.isBookmarked == true }
				} else {
					_ = UserDefaults.standard.images.map { $0.isBookmarked == false }
					UserDefaults.standard.images.removeLast()
					UserDefaults.standard.synchronize()
				}
				let newImage = cell.isBookmarked ? UIImage(named: "bookmarked") :
					UIImage(named: "un_bookmark")
				cell.bookmark.setImage(newImage, for: .normal)

			}
		}
		return cell
	}
}

// MARK: - Layout Cell
extension PhotosViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		return CGSize(width: 90, height: 110)
	}

	func collectionView(_ collectionView: UICollectionView, layout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		return UIEdgeInsets(top: 20, left: 15, bottom: 10, right: 15)
	}
}
