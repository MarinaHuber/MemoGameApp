//
//  File.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 10/30/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
	
	// MARK: - Properties
	var isBookmarked: Bool = false
	@IBOutlet weak var collectionImageView: UIImageView!
	@IBOutlet weak var bookmark: UIButton!
	var saveBlock: (() -> ())?
	
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		collectionImageView?.image = nil
	}
	
	@IBAction func actionBookmark(_ sender: UIButton) {
		self.isBookmarked = !self.isBookmarked
		self.saveBlock?()
	}
}
