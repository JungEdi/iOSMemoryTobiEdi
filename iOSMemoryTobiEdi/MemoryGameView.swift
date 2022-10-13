//
//  EmojiMemoryGameView.swift
//  iOSMemoryTobiEdi
//
//  Created by Tobi Wyss on 13.10.22.
//

import SwiftUI

struct MemoryGameView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGameViewModel
    
    var body: some View {
        ScrollView {
        
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(3/4, contentMode: .fit)
                        .onTapGesture {
                        self.viewModel.choose(card: card)
                    }
                }
            }.padding()
        }
    }
}



struct CardView: View {
    
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader{geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize)-> some View {
        ZStack{
            if self.card.isFaceUp{
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .strokeBorder(lineWidth: edgeLineWidth)
                    .foregroundColor(.blue)
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
            } else if card.isMatched {
                RoundedRectangle(cornerRadius: cornerRadius).opacity(0)
            }
            else{
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.blue)
            }
        }.aspectRatio(0.75, contentMode: .fit)
    }
    
    // MARK: - Drawing Constants
    let cornerRadius = CGFloat(10)
    let edgeLineWidth = CGFloat(3)
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGameView(viewModel: EmojiMemoryGameViewModel())
    }
}
