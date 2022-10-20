//
//  Pie.swift
//  iOSMemoryTobiEdi
//
//  Created by Tobi Wyss on 20.10.22.
//

import SwiftUI

struct Pie : Shape {
    
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        var path =  Path()
          
        path.move(to: center)
        
        let start = CGPoint(x: center.x + radius * cos(CGFloat(startAngle.radians)), y: center.y + radius * sin(CGFloat(startAngle.radians)))
        path.addLine(to: start)
        path.addArc(center: center,
                    radius: radius,
                    startAngle: startAngle,
                    endAngle: endAngle,
                    clockwise: clockwise)
        
        
        path.addLine(to: center)
        
        return path
    }
}

struct Pie_Previews : PreviewProvider {
    static var previews: some View {
        Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90), clockwise: false).foregroundColor(.blue)
    }
    
        
    
}
