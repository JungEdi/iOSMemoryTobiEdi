//
//  MemoryGameModel.swift
//  iOSMemoryTobiEdi
//
//  Created by Tobi Wyss on 13.10.22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent : Equatable {
    
    var cards: Array<Card>
    private var indexOfFaceupCard: Int? {
        get {
            cards.indices.filter {cards[$0].isFaceUp}.only
        }
        
        set {
            for index in cards.indices {
                // newValue ist was von aussen reinkommt
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }

    mutating func choose(card: Card) {
        print("card chosen: \(card)")
        if let chosenIndex =
            cards.firstIndx(matching: card),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfFaceupCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true;
                    cards[potentialMatchIndex].isMatched = true;
                }
            } else {
                indexOfFaceupCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp = !card.isFaceUp
        }
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards{
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable{
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
    
}


