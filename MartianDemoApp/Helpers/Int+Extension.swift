//
//  Int+Extension.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 11/2/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation

// MARK: -Extensions
extension Int {

	var arc4random: Int {
		if self > 0 {
			return Int(arc4random_uniform(UInt32(self)))
		} else if self < 0 {
			return -Int(arc4random_uniform(UInt32(abs(self))))
		} else {
			return 0
		}
	}

}
