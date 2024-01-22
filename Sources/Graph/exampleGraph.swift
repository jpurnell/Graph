//
//  exampleGraph.swift
//
//
//  Created by Justin Purnell on 1/22/24.
//

import Foundation

func exampleGraph() -> Graph<String> {
	let graph = Graph<String>()
	let nodeA = graph.addNode(data: "A")
	let nodeB = graph.addNode(data: "B")
	let nodeC = graph.addNode(data: "C")
	let nodeD = graph.addNode(data: "D")
	let nodeE = graph.addNode(data: "E")
	let nodeF = graph.addNode(data: "F")
	let nodeG = graph.addNode(data: "G")
	let nodeH = graph.addNode(data: "H")
	graph.addEdge(from: nodeA, to: nodeB, weight: 1.0)
	graph.addEdge(from: nodeB, to: nodeC, weight: 2.0)
	graph.addEdge(from: nodeC, to: nodeA, weight: 3.0)
	graph.addEdge(from: nodeD, to: nodeA, weight: 8.0)
	graph.addEdge(from: nodeD, to: nodeB, weight: 3.5)
	graph.addEdge(from: nodeD, to: nodeE, weight: 3.1)
	graph.addEdge(from: nodeD, to: nodeF, weight: 2.5)
	graph.addEdge(from: nodeD, to: nodeG, weight: 5.5)
	graph.addEdge(from: nodeD, to: nodeH, weight: 0.5)
	graph.addEdge(from: nodeA, to: nodeH, weight: 1.5)
	return graph
}
