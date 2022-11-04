//
//  EmojiMemoryGameViewModel.swift
//  iOSMemoryTobiEdi
//
//  Created by Tobi Wyss on 13.10.22.
//

import SwiftUI

class ShapeMemoryGameViewModel: ObservableObject {
    @Published private var model: MemoryGameModel<ShapeWrapper>

    init(screenSize: CGSize, difficulty: Difficulty) {
        model = ShapeMemoryGameViewModel.createMemoryGame(screenSize: screenSize, difficulty: difficulty)
    }

    private static func createMemoryGame(screenSize: CGSize, difficulty: Difficulty) -> MemoryGameModel<ShapeWrapper> {
        let shapes: Array<ShapeWrapper> = ShapeGenerator().generateShapes()
        return MemoryGameModel<ShapeWrapper>(screenSize: screenSize, difficulty: difficulty, maxCardCount: shapes.count, cardContentFactory: { pairIndex in
            shapes[pairIndex]
        })
    }

    // MARK: - Access to the Model
    var cards: [MemoryGameModel<ShapeWrapper>.Card] {
        model.cards
    }

    // MARK: - Intents
    func choose(card: MemoryGameModel<ShapeWrapper>.Card) {
        model.choose(card: card)
    }

    func resetGame() {
        model =
            ShapeMemoryGameViewModel.createMemoryGame(screenSize: model.screenSize, difficulty: model.difficulty)
    }
}
