//
//  MemoryGame  .swift
//  Memorize
//
//  Created by Sergey on 21.11.2022.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter({cards[$0].isFaceUp}).oneAndOnly }
        set { cards.indices.forEach{cards[$0].isFaceUp = ($0 == newValue)} }
    }

     
     mutating func choose (_ card: Card) {
        if let choosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[choosenIndex].isFaceUp,
           !cards[choosenIndex].isMatched
        {
            if let potentioalMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[choosenIndex].content == cards[potentioalMatchIndex].content {
                    cards[choosenIndex].isMatched = true
                    cards[potentioalMatchIndex].isMatched = true
                }
                cards[choosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = choosenIndex
            }
        }
        print("\(cards)")
    }
    
    init (numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        // add numBerOfPairsCars x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex )
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        
    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        let content : CardContent
        let id: Int
        

    }
}

extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}
