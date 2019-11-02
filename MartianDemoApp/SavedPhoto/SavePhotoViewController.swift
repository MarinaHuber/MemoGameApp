//
//  SavePhotoViewController.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 11/01/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

class SavePhotoViewController: UIViewController {

	// MARK: Class properties used
	@IBOutlet weak var collectionView: UICollectionView!
	private var photosSaved: [Photo] = UserDefaults.standard.images


	//MARK: Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		collectionView.dataSource = self
		collectionView.delegate = self
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(showGameVC))
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		let imagesSaved = UserDefaults.standard.images
		if imagesSaved.count > 0 {
			self.title? = "Saved Images"
		} else {
			self.title? = "No images saved"
		}
		collectionView.reloadData()
	}

	@objc func showGameVC () {
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let vc = storyboard.instantiateViewController(withIdentifier: "GameViewController") as? GameViewController ?? GameViewController()
		self.navigationController?.pushViewController(vc, animated: true)
	}
}

//MARK: UICollectionViewDataSource
extension SavePhotoViewController: UICollectionViewDataSource {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.photosSaved.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let photo = UserDefaults.standard.images.item(at: indexPath.row) else {
			return UICollectionViewCell()
		}
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "savedCell", for: indexPath) as? SaveCollectionViewCell ?? SaveCollectionViewCell()
		if let urlObject = URL(string:photo.url ?? "") {
			cell.saveImageView.af_setImage(withURL: urlObject, placeholderImage: UIImage(), filter: nil, progress: nil, progressQueue: DispatchQueue.main, imageTransition: UIImageView.ImageTransition.crossDissolve(0.1), runImageTransitionIfCached: false, completion: nil)
		}
		return cell
	}
}

//MARK: UICollectionView Delegate Layout
extension SavePhotoViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		return CGSize(width: 90, height: 100)
	}

	func collectionView(_ collectionView: UICollectionView, layout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		return UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
	}
}
