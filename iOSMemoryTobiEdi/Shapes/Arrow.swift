import SwiftUI

struct Arrow : Shape {
    
    var rotataion: Angle
    
    func path(in rect: CGRect) -> Path {
        let square = CGRect(x: rect.minX, y: rect.minY, width: min(rect.maxX, rect.maxY), height: min(rect.maxX, rect.maxY))
        
        let xOneThird = (square.minX + square.width)/3
        let xHalf = (square.minX + square.width)/2
        let xTwoThird = (square.minX + square.width)*2/3
        let xEnd = square.maxX
        let yHalf = (square.minY + square.height)/2
        let yEnd = square.maxY
        
        
        
        let point1 = CGPoint(x:xOneThird, y: 0)
        let point2 = CGPoint(x: xTwoThird, y: 0)
        let point3 = CGPoint(x: xTwoThird, y: yHalf)
        let point4 = CGPoint(x: xEnd,y: yHalf)
        let point5 = CGPoint(x: xHalf,y: yEnd)
        let point6 = CGPoint(x:0, y:yHalf)
        let point7 = CGPoint(x: xOneThird, y: yHalf)
        
        
        var path = Path()
        
        path.move(to: point1)
        path.addLine(to:point2)
        path.addLine(to:point3)
        path.addLine(to:point4)
        path.addLine(to:point5)
        path.addLine(to:point6)
        path.addLine(to:point7)
        path.addLine(to:point1)
        return path.rotation(rotataion).path(in: square)
        
    }
}

struct Arrow_Previews : PreviewProvider {
    static var previews: some View {
        Arrow(rotataion: Angle(degrees: 71.456)).foregroundColor(.blue)
    }
    
    
    
}
