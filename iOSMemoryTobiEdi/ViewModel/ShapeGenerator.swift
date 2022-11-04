//
// Created by Tobi Wyss on 04.11.22.
//

import SwiftUI

struct ShapeGenerator {
    // MARK - Drawing constant
    private let shapeMinSize: Double = 20
    private let shapeMaxSize: Double = 40
    private let shapeMinRotation: Double = 0
    private let shapeMaxRotation: Double = 360
    private let shapeColors =
        [Color.blue, Color.red, Color.black, Color.orange, Color.brown, Color.cyan, Color.purple, Color.green, Color.indigo, Color.gray];

    // MARK - public methods
    func generateShapes() -> Array<ShapeWrapper> {
        var shapePairId = 0 // the unique id of each shape pair
        return shapeColors.flatMap { color in
                randomShapes().map { shape in
                    shapePairId += 1
                    return ShapeWrapper(id: shapePairId, shape: shape.foregroundColor(color))
                }
            }
            .shuffled()
    }

    // MARK - private methods
    private func randomShapes() -> [any View] {
        let arrowSize = Double.random(in: shapeMinSize..<shapeMaxSize)
        let arrowRotation = Double.random(in: shapeMinRotation..<shapeMaxRotation)
        let triangleSize = Double.random(in: shapeMinSize..<shapeMaxSize)
        let triangleRotation = Double.random(in: shapeMinRotation..<shapeMaxRotation)
        let circleSize = Double.random(in: shapeMinSize..<shapeMaxSize)
        let rectangleSize = Double.random(in: shapeMinSize..<shapeMaxSize)
        let randomShapes: [any View] = [
            Arrow(rotation: Angle(degrees: arrowRotation), size: arrowSize).frame(width: arrowSize, height: arrowSize),
            Circle().frame(width: circleSize, height: circleSize),
            Rectangle().frame(width: rectangleSize, height: rectangleSize),
            Triangle(rotation: Angle(degrees: triangleRotation), size: triangleSize).frame(width: triangleSize, height: triangleSize)
        ]
        return randomShapes
    }
}
