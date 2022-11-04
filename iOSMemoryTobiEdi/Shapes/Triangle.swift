import SwiftUI

struct Triangle : Shape {
    var rotation: Angle
    var size: Double

    func path(in rect: CGRect) -> Path {
        let square = CGRect(x: rect.minX, y: rect.minY, width: size, height: size)
        
        let xHalf = (square.minX + square.width)/2
        let xEnd = square.maxX
        let yEnd = square.maxY
        
        let point1 = CGPoint(x:xHalf, y: 0)
        let point2 = CGPoint(x: 0, y: yEnd)
        let point3 = CGPoint(x: xEnd, y: yEnd)

        var path = Path()
        path.move(to: point1)
        path.addLine(to:point2)
        path.addLine(to:point3)
        path.addLine(to:point1)
        return path.rotation(rotation).path(in: square)
    }
}

struct Triangle_Previews : PreviewProvider {
    static var previews: some View {
        Triangle(rotation: Angle(degrees: 30), size: 200).foregroundColor(.blue).frame(width: 200, height: 200).border(.blue)
    }
}
