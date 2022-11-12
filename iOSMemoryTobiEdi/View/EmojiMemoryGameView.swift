//
//  EmojiMemoryGameView.swift
//  iOSMemoryTobiEdi
//
//  Created by Tobi Wyss on 13.10.22.
//

import SwiftUI

struct EmojiMemoryGameView: View {

    @ObservedObject
    var viewModel: EmojiMemoryGameViewModel


    var body: some View {
        VStack {
            ScoreView(highScore: viewModel.highScore, currentScore: viewModel.score)
                
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: minimumColumnWidth))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card) { content in Text(content) }
                            .aspectRatio(cardAspectRatio, contentMode: .fit)
                            .onTapGesture {
                                withAnimation(.linear(duration: rotationDuration)) {
                                    viewModel.choose(card: card)
                                }
                            }
                    }
                }
                    .foregroundColor(Color.blue)
            }
        }
            .padding(.horizontal)
            .onAppear {
                withAnimation(.easeInOut) {
                    viewModel.resetGame()
                }
            }
    }

    // MARK: - Drawing Constants
    private let minimumColumnWidth = Double(65)
    private let rotationDuration = Double(0.75)
    private let cardAspectRatio = CGFloat(0.7)
}

struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGameViewModel(screenSize: UIScreen.main.bounds.size, difficulty: .easy)
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}
