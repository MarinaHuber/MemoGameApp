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
	collectionView.delegate = self
	collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: "photoCell")

	//self.registerCells(in: collectionView)
}

// MARK: - Helper
	
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
		//cell.configure(with: [photo])

		return cell
	}
}
// MARK: - Delegate

extension PhotosViewControllerDataSource: UICollectionViewDelegate {

	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

	}
}

// MARK: - Layout Cell

extension PhotoCollectionViewCell: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		return collectionView.bounds.size
	}
}
