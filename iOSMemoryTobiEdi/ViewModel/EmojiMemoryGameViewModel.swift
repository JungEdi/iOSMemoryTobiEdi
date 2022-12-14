//
//  EmojiMemoryGameViewModel.swift
//  iOSMemoryTobiEdi
//
//  Created by Tobi Wyss on 13.10.22.
//

import Foundation

class EmojiMemoryGameViewModel: ObservableObject {
    private static let animals = ["๐", "๐", "๐", "๐ฆ", "๐ฎ", "๐ท", "๐ธ", "๐", "๐", "๐ง", "๐ฆ", "๐ค", "๐ฆ", "๐ฆ", "๐ฆ", "๐ฆ", "๐บ", "๐", "๐ด", "๐ฆ", "๐", "๐ชฑ", "๐", "๐ฆ", "๐", "๐", "๐", "๐ชฐ", "๐ชฒ", "๐ชณ", "๐ฆ", "๐ฆ", "๐ท", "๐ฆ", "๐ข", "๐", "๐ฆ", "๐ฆ"];
    private static let faces = ["๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐คฃ", "๐ฅฒ", "๐ฅน", "โบ๏ธ", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐ฅฐ", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐คช", "๐คจ", "๐ง", "๐ค", "๐", "๐ฅธ", "๐คฉ", "๐ฅณ", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "โน๏ธ", "๐ฃ", "๐", "๐ซ", "๐ฉ", "๐ฅบ", "๐ข", "๐ญ", "๐ฎโ๐จ", "๐ค", "๐ ", "๐ก", "๐คฌ", "๐คฏ", "๐ณ", "๐ฅต", "๐ฅถ", "๐ฑ", "๐จ", "๐ฐ", "๐ฅ", "๐", "๐ซฃ", "๐ค", "๐ซก", "๐ค", "๐ซข", "๐คญ", "๐คซ", "๐คฅ", "๐ถ", "๐ถโ๐ซ๏ธ", "๐", "๐", "๐ฌ", "๐ซ ", "๐", "๐ฏ", "๐ฆ", "๐ง", "๐ฎ", "๐ฒ", "๐ฅฑ", "๐ด", "๐คค", "๐ช", "๐ต", "๐ตโ๐ซ", "๐ซฅ", "๐ค", "๐ฅด", "๐คข", "๐คฎ", "๐คง", "๐ท", "๐ค", "๐ค", "๐ค", "๐ค "]
    private static let food = ["๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐ซ", "๐", "๐", "๐", "๐ฅญ", "๐", "๐ฅฅ", "๐ฅ", "๐", "๐", "๐ฅ", "๐ฅฆ", "๐ฅฌ", "๐ฅ", "๐ถ", "๐ซ", "๐ฝ", "๐ฅ", "๐ซ", "๐ง", "๐ง", "๐ฅ", "๐ ", "๐ซ", "๐ฅ", "๐ฅฏ", "๐", "๐ฅ", "๐ฅจ", "๐ง", "๐ฅ", "๐ณ", "๐ง", "๐ฅ", "๐ง", "๐ฅ", "๐ฅฉ", "๐", "๐", "๐ฆด", "๐ญ", "๐", "๐", "๐", "๐ซ", "๐ฅช", "๐ฅ", "๐ง", "๐ฎ", "๐ฏ", "๐ซ", "๐ฅ", "๐ฅ", "๐ซ", "๐ฅซ", "๐", "๐", "๐ฒ", "๐", "๐ฃ", "๐ฑ", "๐ฅ", "๐ฆช", "๐ค", "๐", "๐", "๐", "๐ฅ", "๐ฅ ", "๐ฅฎ", "๐ข", "๐ก", "๐ง", "๐จ", "๐ฆ", "๐ฅง", "๐ง", "๐ฐ", "๐", "๐ฎ", "๐ญ", "๐ฌ", "๐ซ", "๐ฟ", "๐ฉ", "๐ช", "๐ฐ", "๐ฅ", "๐ฏ", "๐ฅ", "๐ผ", "๐ซ", "โ๏ธ", "๐ต", "๐ง", "๐ฅค", "๐ง", "๐ซ", "๐ถ", "๐บ", "๐ป", "๐ฅ", "๐ท", "๐ซ", "๐ฅ", "๐ธ", "๐น", "๐ง", "๐พ", "๐ง", "๐ฅ", "๐ด", "๐ฝ", "๐ฅฃ", "๐ฅก", "๐ฅข", "๐ง"]
    private static let emojiCollections = [animals, faces, food]


    init(screenSize: CGSize, difficulty: Difficulty) {
        model = EmojiMemoryGameViewModel.createMemoryGame(screenSize: screenSize, difficulty: difficulty)
    }

    @Published private var model: MemoryGameModel<String>

    static func createMemoryGame(screenSize: CGSize, difficulty: Difficulty) -> MemoryGameModel<String> {
        //shuffled emojiCollection to get a Random Collection and then Shuffle the random Collection to get random Emojis
        let emojis: Array<String> = emojiCollections.randomElement()?.shuffled() ?? food.shuffled()
        return MemoryGameModel<String>(screenSize: screenSize, difficulty: difficulty, maxCardCount: emojis.count, cardContentFactory: { pairIndex in
            emojis[pairIndex]
        })
    }

    // MARK: - Access to the Model

    var cards: [MemoryGameModel<String>.Card] {
        model.cards
    }
    
    var score: Int{
        model.score
    }
    
    var highScore: Int{
        model.highScore
    }

    // MARK: - Intents

    func choose(card: MemoryGameModel<String>.Card) {
        model.choose(card: card)
    }

    func resetGame() {
        model = EmojiMemoryGameViewModel.createMemoryGame(screenSize: model.screenSize, difficulty: model.difficulty)
    }
}
