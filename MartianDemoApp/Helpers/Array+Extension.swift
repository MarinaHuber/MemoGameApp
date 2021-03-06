//
//  Array+Extension.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 10/30/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation

public extension Array {
	
	/// Element at the given index if it exists.
	///
	/// - Parameter index: index of element.
	/// - Returns: optional element (if exists).
	func item(at index: Int) -> Element? {
		
		if 0..<self.count ~= index {
			return self[index]
		}
		return nil
	}

	/** Randomizes the order of an array's elements. */
//	mutating func shuffle()
//	{
//		for _ in 0..<10
//		{
//			sort { (_,_) in arc4random() < arc4random() }
//		}
//	}
	
}
