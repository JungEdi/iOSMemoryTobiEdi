//
//  EmojiMemoryGameViewModel.swift
//  iOSMemoryTobiEdi
//
//  Created by Tobi Wyss on 13.10.22.
//

import Foundation

class ShapeMemoryGameViewModel: ObservableObject {
    
    init(difficulty: Difficulty) {
        model = ShapeMemoryGameViewModel.createMemoryGame()
    }
    
    @Published private var model: MemoryGameModel<String>
    
    static func createMemoryGame()->MemoryGameModel<String> {
        let shapes: Array<String> = ["1", "2", "3", "4", "5", "6"]
        return  MemoryGameModel<String>(numberOfPairsOfCards: shapes.count, cardContentFactory: { pairIndex in
            shapes[pairIndex]
        })
    }
    
    // MARK: - Access to the Model
    var cards: [MemoryGameModel<String>.Card]{
        model.cards
    }
    
    // MARK: - Intents
    func choose(card: MemoryGameModel<String>.Card){
        model.choose(card: card)
    }
    
    func resetGame(){
       model = ShapeMemoryGameViewModel.createMemoryGame()
    }
}
