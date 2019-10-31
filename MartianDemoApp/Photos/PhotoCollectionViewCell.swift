//
//  File.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 10/29/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit


class PhotoCollectionViewCell: UICollectionViewCell {
	@IBOutlet weak var collectionImageView: UIImageView!
	@IBOutlet weak var bookmark: UIButton!
	
    // MARK: - Properties
     var photos: [Photo]?

	override func awakeFromNib() {
		super.awakeFromNib()

	}
	override func prepareForReuse() {
		super.prepareForReuse()
		collectionImageView?.image = nil
	}

	@IBAction func actionBookmark(_ sender: UIButton) {
	}
}
