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

	self.registerCells(in: collectionView)
}

// MARK: - Helper
private func registerCells(in collectionView: UICollectionView) {
	collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: "photoCell")
}
	
}

// MARK: - DataSource
extension PhotosViewControllerDataSource: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
    }
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		self.photosList.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let photo = self.photosList.item(at: indexPath.row) else {
            return UICollectionViewCell()
        }
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? PhotoCollectionViewCell ?? PhotoCollectionViewCell()
		cell.configure(with: [photo])
		return cell
	}

}

// MARK: - Delegate
extension PhotosViewControllerDataSource: UICollectionViewDelegate {

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {

        return 60
    }
}
