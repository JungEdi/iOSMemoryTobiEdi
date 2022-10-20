//
//  Cardify.swift
//  iOSMemoryTobiEdi
//
//  Created by Tobi Wyss on 20.10.22.
//

import SwiftUI
    
struct Cardify: ViewModifier {
    
    var isFaceUp: Bool
    
    func  body(content: Content) -> some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .strokeBorder(lineWidth: edgeLineWidth)
                content

            } else {
                RoundedRectangle(cornerRadius: cornerRadius)
            }
        }
    }
    
    
    let cornerRadius = CGFloat(10)
    let edgeLineWidth = CGFloat(3)

}

extension View{
    func cardify(isFaceUp: Bool) -> some View {
        modifier(Cardify(isFaceUp: isFaceUp))
    }
}
