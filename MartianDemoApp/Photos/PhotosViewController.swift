//
//  PhotosViewController.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 10/29/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		loadPhotos()
	}

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
	}

	func loadPhotos() {
	NetworkApi.getPhotosByAlbumID(22, completionHandler: {
		pLoaded, error in

	})
	}

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

}

