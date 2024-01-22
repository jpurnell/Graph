// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

class Graph<T> where T: Hashable {
	private(set) var edges: Set<Edge<T>> = []
	private(set) var nodes: Set<Node<T>> = []
	
	func addNode(data: T) -> Node<T> {
		let node = Node(data: data)
		nodes.insert(node)
		return node
	}
	
	func addEdge(from: Node<T>, to: Node<T>, weight: Double) {
		guard nodes.contains(from), nodes.contains(to) else { return }
		let edge = Edge(from: from, to: to, weight: weight)
		edges.insert(edge)
	}
	
	func weightForEdge(from: Node<T>, to: Node<T>, weightFunction: (T, T) -> Double) -> Double {
		return weightFunction(from.data, to.data)
	}
	
	func weightForNode(_ node: Node<T>) -> Double {
		Double(edges.filter({$0.from == node || $0.to == node}).count * 8)
	}
}
