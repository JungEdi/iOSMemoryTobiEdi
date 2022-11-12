//
//  EmojiMemoryGameView.swift
//  iOSMemoryTobiEdi
//
//  Created by Tobi Wyss on 13.10.22.
//

import SwiftUI

struct ShapeMemoryGameView: View {

    @ObservedObject
    var viewModel: ShapeMemoryGameViewModel

    var body: some View {
        VStack {
            ScoreView(highScore: viewModel.highScore, currentScore: viewModel.score)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: minimumColumnWidth))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)  { content in content.shape }
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

struct ShapeMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        let game = ShapeMemoryGameViewModel(screenSize: UIScreen.main.bounds.size, difficulty: .easy)
        game.choose(card: game.cards[0])
        return ShapeMemoryGameView(viewModel: game)
    }
}
