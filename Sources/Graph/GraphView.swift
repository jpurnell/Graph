//
//  File.swift
//  
//
//  Created by Justin Purnell on 1/22/24.
//

import Foundation
import SwiftUI

@available(iOS 13.0, macOS 10.15, *)
struct GraphView<T>: View where T: Hashable {
	var graph: Graph<T>
	
	var body: some View {
		// Placeholder view for graph visualization
		GeometryReader { geometry in
			ZStack {
				// Draw edges
				ForEach(Array(graph.edges), id: \.self) { edge in
					Path { path in
						let fromPoint = self.point(for: edge.from, in: geometry.size)
						let toPoint = self.point(for: edge.to, in: geometry.size)
						path.move(to: fromPoint)
						path.addLine(to: toPoint)
					}
					.stroke(lineWidth: CGFloat(edge.weight))
				}
				// Draw nodes
				ForEach(Array(graph.nodes), id: \.self) { node in
					Circle()
						.frame(width: graph.weightForNode(node), height: graph.weightForNode(node))
						.position(self.point(for: node, in: geometry.size))
						.opacity(1.0)
				}
			}
		}
	}
	
	// Helper function to determine where to place each node
	private func point(for node: Node<T>, in size: CGSize) -> CGPoint {
		guard let index = graph.nodes.firstIndex(of: node) else {
			return .zero
		}
		let indexValue = graph.nodes.distance(from: graph.nodes.startIndex, to: index)
		let angleStep = 2 * Double.pi / Double(graph.nodes.count)
		let angle = angleStep * Double(indexValue)
		let centerX = size.width / 2
		let centerY = size.height / 2
		let radius = min(size.width, size.height) / 3
		let x = centerX + radius * cos(angle)
		let y = centerY + radius * sin(angle)
		return CGPoint(x: x, y: y)
	}
}

	// Example SwiftUI preview
@available(iOS 13.0.0, macOS 10.15, *)
struct GraphView_Previews: PreviewProvider {
		static var previews: some View {
			GraphView(graph: exampleGraph())
				.previewLayout(.sizeThatFits)
		}
	}
