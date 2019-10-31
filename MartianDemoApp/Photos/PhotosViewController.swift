//
//  PhotosViewController.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 10/29/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit
import RealmSwift

class PhotosViewController: UIViewController {

	@IBOutlet weak var photoCollectionView: UICollectionView!
	private var dataSource: PhotosViewControllerDataSource?
	private var albums: [Album]? = []
	private var albumID: Int?
	@IBOutlet weak var bookmark: UIButton!

	var bookmarkedAll: Bool = false  {
		didSet {
//			if (bookmarkedAll) {
//				guard let album = albums else  { return }
//				let sameObjectFromDB = myRealm.objects(AlbumRealm.self).filter("id = '\(album.id)'")
//				if sameObjectFromDB.count != 0 {
//					print("saved == \(sameObjectFromDB.count) albums")
//					//I have same album saved
//					try! myRealm.write({
//						myRealm.delete(sameObjectFromDB)
//					})
//				} else {
//					try! myRealm.write {
//						let albumNew = self.getAlbum()
//						myRealm.add(albumNew, update: .modified)
//					}
//				}
//			} else if let album = savedAlbumInfo {
//				try! myRealm.write({
//					myRealm.delete(album)
//				})
//			}
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		photoCollectionView.delegate = self
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(loadView))

		loadPhotos()

		
	}

	override func viewWillLayoutSubviews() {
		photoCollectionView.layoutIfNeeded()
	}

	@objc func loadPhotos() {
//		let mSavedItems = myRealm.objects(AlbumRealm.self)
//		let savedID = mSavedItems.filter { $0.id == self.albumID }
//		if savedID.count > 0 {
		albums?.forEach {
		guard let albumID = $0.id else { return }
		NetworkApi.getPhotosByAlbumID(albumID, completionHandler: {
		photosLoaded, error in
			self.setDateSource(with: photosLoaded)
			//self.photoCollectionView.reloadData()

	})

    }
	}
    private func setDateSource(with photos: [Photo]) {
		self.dataSource = PhotosViewControllerDataSource(with: photos, collectionView: self.photoCollectionView)
		photoCollectionView.reloadData()
    }

	// MARK: - Helper navigation
	func configure(with albums: [Album]) {
		self.albums = albums
    }

//	@IBAction func actionBookmark(_ sender: UIButton) {
//		self.bookmarkedAll = !self.bookmarkedAll
//		self.updateBookmarkButton()
//	}
//
//	func updateBookmarkButton() {
//		let newImage = self.bookmarkedAll ? UIImage(named: "w_bookmark") :
//		UIImage(named: "w_bookmarkUn")
//		bookmark.setImage(newImage, for: .normal)
//
//	}
}
