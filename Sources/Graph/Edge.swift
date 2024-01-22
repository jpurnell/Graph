//
//  Edge.swift
//
//
//  Created by Justin Purnell on 1/22/24.
//

import Foundation

struct Edge<T>: Hashable where T: Hashable {
	let from: Node<T>
	let to: Node<T>
	let weight: Double
}
