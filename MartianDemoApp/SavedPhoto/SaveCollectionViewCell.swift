//
//  SaveCollectionViewCell.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 10/31/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

class SaveCollectionViewCell: UICollectionViewCell {
	
	@IBOutlet weak var saveImageView: UIImageView!
	
	// MARK: - LifeCycle
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		saveImageView?.image = nil
	}
}
