//
//  Node.swift
//
//
//  Created by Justin Purnell on 1/22/24.
//

import Foundation

struct Node<T>: Hashable where T: Hashable {
	let id: UUID
	var data: T
	
	init(data: T) {
		self.id = UUID()
		self.data = data
	}
}
