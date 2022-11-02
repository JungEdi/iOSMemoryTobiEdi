//
//  EmojiMemoryGameView.swift
//  iOSMemoryTobiEdi
//
//  Created by Tobi Wyss on 13.10.22.
//

import SwiftUI

struct MemoryGameView: View {
    
    @ObservedObject
    var viewModel: EmojiMemoryGameViewModel
    
    var body: some View {
        VStack{
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: minimumColumnWidth))]) {
                    ForEach(viewModel.cards){ card in
                        CardView(card: card)
                            .aspectRatio(cardAspectRatio, contentMode: .fit)
                            .onTapGesture {
                                withAnimation(.linear(duration: rotationDuration)) {
                                    self.viewModel.choose(card: card)
                                }
                        }
                    }
                }.foregroundColor(Color.blue)
            }.padding(.horizontal)
            Button(action: {
                withAnimation(.easeInOut){
                    self.viewModel.resetGame()
                }
            }, label: {Text("New Game")})
        }
    }
    
    // MARK: - Drawing Constants
    private let minimumColumnWidth = Double(65)
    private let rotationDuration = Double(0.75)
    private let cardAspectRatio = CGFloat(0.7)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGameViewModel()
        game.choose(card: game.cards[0])
        return MemoryGameView(viewModel: game)
    }
}
