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
//	private var photoList: [Photo] = []
//
//// MARK: - Init
//init(with albumsList: [Photo], tableView: UICollectionView) {
//	super.init()
//	self.photoList = photoList
//
//	self.registerCells(in: collectionView)
//}
//
//// MARK: - Helper
//private func registerCells(in collectionView: UITableView) {
//	tableView.register(cellType: PhotoCollectionViewCell.self)
//}
}

// MARK: - DataSource
extension PhotosViewControllerDataSource: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
    }
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		1
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? PhotoCollectionViewCell ?? PhotoCollectionViewCell()
		//(cell as? PhotoCollectionViewCell)?.configure(with: photoList)
		return cell
	}

}

// MARK: - Delegate
extension PhotosViewControllerDataSource: UICollectionViewDelegate {

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {

        return 60
    }
}