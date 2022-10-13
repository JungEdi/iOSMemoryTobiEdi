//
//  EmojiMemoryGameViewModel.swift
//  iOSMemoryTobiEdi
//
//  Created by Tobi Wyss on 13.10.22.
//

import Foundation

class EmojiMemoryGameViewModel: ObservableObject {
    
    init() {
        model = EmojiMemoryGameViewModel.createMemoryGame()
    }
    
    @Published private var model: MemoryGame<String>
    
    static func createMemoryGame()->MemoryGame<String> {
        let emojis: Array<String> = ["🙈","🙉", "🙊", "🏎","😃", "🧘🏻‍♂️", "🌍", "🌦️", "🍞", "🚗", "📞", "🎉", "❤️", "🍆", "🍑"]
        return  MemoryGame<String>(numberOfPairsOfCards: emojis.count, cardContentFactory: { pairIndex in
            return emojis[pairIndex]
        })
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intents
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
}

