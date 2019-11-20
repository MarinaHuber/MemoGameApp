//
//  GameViewController.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 11/2/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

	@IBOutlet weak var restartButton: UIButton!
	private var imageUrls: [URL] = []
	private var tempUrls: [URL] = []
	private var images: [UIImage] = []
	private var imagesSaved: [Photo] = UserDefaults.standard.images

	private lazy var game = Matching(numberOfPairsOfCards: numberOfPairsOfCards)
	var numberOfPairsOfCards: Int {
		return cardButtons.count / 2
	}

	@IBOutlet private(set) var cardButtons: [UIButton]!

	override func viewDidLoad() {
		super.viewDidLoad()
		if imagesSaved.count >= 16 {
			loadCardImages()
			updateView()
		} else {
			for index in cardButtons.indices {
				cardButtons?[index].isEnabled = false
				self.presentAlert(message: "Izaberite minimum 16 karata", title: "Nema dovoljno pohranjenih karata")
			}
		}
	}

	private func updateView() {
		var button1: UIButton?
		var button2: UIButton?

		for index in cardButtons.indices {
			let button = cardButtons[index]
			let card = game.cards[index]
			if card.isFaceUp {
				button.setBackgroundImage(self.images[index], for: .normal)
				button.isEnabled = false
				if button1 == nil {
					button1 = button
				} else if button2 == nil {
					button2 = button
				}

			} else {
				button.isEnabled = true
			}
		}

		if button1 != nil && button2 != nil {
			let data1 = button1!.currentBackgroundImage!.pngData()
			let data2 = button2!.currentBackgroundImage!.pngData()
			if data1 == data2 {
				print("Matched")
				game.matches = game.matches + 1
				DispatchQueue.main.async(execute: {
				UIView.animate(withDuration: 0.6, animations: {
					assert(true, "matched inside")
					button1?.alpha =  0
					button2?.alpha =  0
					button1 = nil
					button2 = nil
					button2?.setBackgroundImage(nil, for: .selected)
					button2?.setBackgroundImage(nil, for: .selected)

				})
			})


			} else {
				print("Not Matched!")

				DispatchQueue.main.async(execute: {
					UIView.animateKeyframes(withDuration: 0.2, delay: 0.5, options: UIView.KeyframeAnimationOptions.allowUserInteraction, animations: {
						button1?.alpha = 0.5
						button2?.alpha = 0.5
					}, completion: {
						completed in
						button1?.setBackgroundImage(nil, for: .normal)
						button2?.setBackgroundImage(nil, for: .normal)

						button1?.alpha = 1
						button2?.alpha = 1
					})
				})
			}
		}
	}

	// MARK: - Load on main threat
	func loadCardImages() {
		if imageUrls.isEmpty {
			for (index,image) in imagesSaved.enumerated() {
				if index < 8 {
				if let urlImage = URL(string:image.url ?? "") {
					self.imageUrls.append(urlImage)
					self.tempUrls.append(urlImage)
				}
			}
				for url in self.tempUrls {
					self.imageUrls.append(url)
			}
				self.imageUrls.shuffle()
				for url in self.imageUrls {
				self.downloadImage(url: url)
			}
		}
	  }
	}


	// MARK: - Data into UIImage
	func downloadImage(url: URL) {
		Service.getDataFromUrl(url: url) { data, error in
			guard let data = data, error == nil else { return }
			print(#file, #line, #function, "Download Finished")
			self.images.append(UIImage(data: data)!)
		}
	}

	// MARK: - IBActions
	@IBAction private func selectCard(_ sender: UIButton) {
		if let cardNumber = cardButtons.firstIndex(of: sender) {
			game.chooseCard(at: cardNumber)
			updateView()


		} else {
			print(#file, #line, #function, (cardButtons.count), "Chosen card was not in cardButtons")
		}
		if game.matches == self.numberOfPairsOfCards {

		}

	}
	@IBAction func resetAction(_ sender: Any) {
	}


}
