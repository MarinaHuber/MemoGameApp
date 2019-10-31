//
//  SavePhotoViewController.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 10/31/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

class SavePhotoViewController: UIViewController {
// MARK: Class properties used

	@IBOutlet weak var collectionView: UICollectionView!
	@IBOutlet weak var noAlbumsStoredLabel: UILabel!
	private var albums = [PhotoRealm]()

//MARK: Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()

	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		if albums.count > 0 {
			self.navigationItem.title? = "Saved Images"
		} else {
			self.navigationItem.title? = "No images saved"
		}
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
	}
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.navigationBar.tintColor = .black
		//albums = AlbumIRealm.all()
		collectionView.reloadData()
		noAlbumsStoredLabel.isHidden = albums.count > 0
	}

}


//MARK: UICollectionViewDataSource
extension SavePhotoViewController: UICollectionViewDataSource {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return albums.count
	}



	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		if indexPath.row >= albums.count {
			print(indexPath.row)
		}
		let cellDataRealm = albums[indexPath.row]
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "", for: indexPath)

//		if let urlObject = URL(string: cellDataRealm.url) {
//			cell?.collectionImage.af_setImage(
//				withURL: urlObject, placeholderImage: UIImage(), filter: nil, progress: nil, progressQueue: DispatchQueue.main, imageTransition: UIImageView.ImageTransition.crossDissolve(0.1), runImageTransitionIfCached: false, completion: nil)
//		} else {
//			cell?.collectionImage.image = nil
//
//		}
		return cell
	}

}
//MARK: UICollectionView Delegate Layout
extension SavePhotoViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		return CGSize(width: 90, height: 70)
	}
}
