import SwiftUI

struct Cardify: AnimatableModifier {
    private let isStillFaceUp: Double = 90
    var isFaceUp: Bool {
        rotation < isStillFaceUp
    }
    
    private var rotation: Double
    
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? rotationUp : rotationDown
    }
    
    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    
    func body(content: Content) -> some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .strokeBorder(lineWidth: edgeLineWidth)
                content
            }.opacity(isFaceUp ? opaque : transparent)
            RoundedRectangle(cornerRadius: cornerRadius).fill()
                .opacity(isFaceUp ? transparent : opaque)
        }
        .rotation3DEffect(Angle(degrees: rotation),
                          axis: (0,1,0))
    }
    
    // MARK: - Drawing Constants
    private let cornerRadius = CGFloat(10)
    private let edgeLineWidth: CGFloat = 3
    private let rotationUp = Double(0)
    private let rotationDown = Double(180)
    private let transparent = Double(0)
    private let opaque = Double(1)
}

extension View{
    func cardify(isFaceUp: Bool)-> some View{
        return self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
