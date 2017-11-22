import FisherYates
import PlayingCard

public struct Deck {
  private var cards: [PlayingCard]

  public static func standard52CardDeck() -> Deck {
    let ranks: [Rank] = [
      .two, .three, .four, .five, .six, .seven, .eight, .nine, .ten,
      .jack, .queen, .king, .ace
    ]
    let suits: [Suit] = [.spades, .hearts, .diamonds, .clubs]

    var cards: [PlayingCard] = []

    for rank in ranks {
      for suit in suits {
        cards.append(PlayingCard(rank: rank, suit: suit))
      }
    }

    return Deck(cards)
  }

  public init(_ cards: [PlayingCard]) {
    self.cards = cards
  }

  public mutating func deal() -> PlayingCard? {
    guard !cards.isEmpty else { return nil }

    return cards.removeLast()
  }

  public mutating func shuffle() {
    cards.shuffle()
  }

  public var count: Int {
    return cards.count
  }
}

extension Deck: Equatable {
  public static func ==(lhs: Deck, rhs: Deck) -> Bool {
    return lhs.cards == rhs.cards
  }
}

extension Deck: ExpressibleByArrayLiteral {
  public init(arrayLiteral elements: PlayingCard...) {
    self.init(elements)
  }
}

// extension Deck: Sequence {
//   public func makeIterator() -> DeckIterator {
//     return DeckIterator(self)
//   }
//
//   public struct DeckIterator: IteratorProtocol {
//     let deck: Deck
//     var index = 0
//
//     init(_ deck: Deck) {
//       self.deck = deck
//     }
//
//     public mutating func next() -> PlayingCard? {
//       let nextIndex = index
//
//       guard nextIndex < deck.count else { return nil }
//
//       index += 1
//
//       return deck.cards[nextIndex]
//     }
//   }
// }
