//
//  File.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 10/29/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit
import AlamofireImage

class PhotoCollectionViewCell: UICollectionViewCell {
	@IBOutlet weak private var collectionImageView: UIImageView!
	
    // MARK: - Properties
    private var photos: [Photo]?
	// MARK: - Configuration
	internal func configure(with photos: [Photo]?) {
		guard let photos = self.photos else {
			return
		}
		photos.forEach {
			if let imageUrl = $0.url {
			collectionImageView?.af_setImage(withURL: imageUrl,
												  placeholderImage: nil,
												  imageTransition: UIImageView.ImageTransition.crossDissolve(0.3),
												  runImageTransitionIfCached: true,
												  completion: nil)
			   }
			}
		}

}

