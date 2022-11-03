//
//  EmojiMemoryGameViewModel.swift
//  iOSMemoryTobiEdi
//
//  Created by Tobi Wyss on 13.10.22.
//

import Foundation

class EmojiMemoryGameViewModel: ObservableObject {

    init(screenSize: CGSize, difficulty: Difficulty) {
        model = EmojiMemoryGameViewModel.createMemoryGame(screenSize: screenSize, difficulty: difficulty)
    }

    @Published private var model: MemoryGameModel<String>

    static func createMemoryGame(screenSize: CGSize, difficulty: Difficulty) -> MemoryGameModel<String> {
        let emojis: Array<String> = ["🙈", "🙉", "🙊", "🦁", "🐮", "🐷", "🐸", "🐒", "🐔", "🐧", "🐦", "🐤", "🦆", "🦅", "🦉", "🦇", "🐺", "🐗", "🐴", "🦄", "🐝", "🪱", "🐛", "🦋", "🐌", "🐞", "🐜", "🪰", "🪲", "🪳", "🦟", "🦗", "🕷", "🦂", "🐢", "🐍", "🦎", "🦖"]
        return MemoryGameModel<String>(screenSize: screenSize, difficulty: difficulty, maxCardCount: emojis.count, cardContentFactory: { pairIndex in
            emojis[pairIndex]
        })
    }

    // MARK: - Access to the Model

    var cards: [MemoryGameModel<String>.Card] {
        model.cards
    }

    // MARK: - Intents

    func choose(card: MemoryGameModel<String>.Card) {
        model.choose(card: card)
    }

    func resetGame() {
        model = EmojiMemoryGameViewModel.createMemoryGame(screenSize: model.screenSize, difficulty: model.difficulty)
    }

}
