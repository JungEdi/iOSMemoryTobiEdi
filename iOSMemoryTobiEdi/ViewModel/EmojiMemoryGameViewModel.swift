//
//  EmojiMemoryGameViewModel.swift
//  iOSMemoryTobiEdi
//
//  Created by Tobi Wyss on 13.10.22.
//

import Foundation

class EmojiMemoryGameViewModel: MemoryGameViewModel{
    
    init() {
        model = EmojiMemoryGameViewModel.createMemoryGame()
    }
    
    @Published private var model: MemoryGameModel<String>
    
    private static func createMemoryGame()->MemoryGameModel<String> {
        let emojis: Array<String> = ["🙈","🙉", "🙊", "🏎","😃", "🧘🏻‍♂️", "🌍", "🌦️", "🍞", "🚗", "📞", "🎉", "❤️", "🍆", "🍑"]
        return  MemoryGameModel<String>(numberOfPairsOfCards: emojis.count, cardContentFactory: { pairIndex in
            return emojis[pairIndex]
        })
    }
    
    var gameStarted = false;
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGameModel<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intents
    
    func choose(card: MemoryGameModel<String>.Card) {
        model.choose(card: card)
    }
    
}

