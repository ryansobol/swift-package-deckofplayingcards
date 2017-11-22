import XCTest
@testable import PlayingCard
@testable import DeckOfPlayingCards

class DeckTests: XCTestCase {
  func testStandard52CardDeck() {
    let reducer: ([PlayingCard], Rank) -> [PlayingCard] = { cards, rank in
      let suits: [Suit] = [.spades, .hearts, .diamonds, .clubs]

      let fourOfAKind = suits.map { suit in
        PlayingCard(rank: rank, suit: suit)
      }

      return cards + fourOfAKind
    }

    let ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
      .flatMap { Rank(rawValue: $0) }

    let cards = ranks.reduce([PlayingCard](), reducer)

    XCTAssertEqual(Deck.standard52CardDeck(), Deck(cards))
  }

  func testDeal() {
    let card = PlayingCard(rank: Rank.ace, suit: Suit.clubs)
    var deck: Deck = [card]

    XCTAssertEqual(deck.deal(), card)
    XCTAssertNil(deck.deal())
  }

  func testShuffle() {
    var deck1 = Deck.standard52CardDeck()
    var deck2 = Deck.standard52CardDeck()

    XCTAssertEqual(deck1, deck2)

    deck2.shuffle()

    XCTAssertNotEqual(deck1, deck2)
    XCTAssertEqual(deck1.count, deck2.count)

    var set1 = Set<PlayingCard>(minimumCapacity: deck1.count)

    for _ in 0..<deck1.count {
      if let card1 = deck1.deal() {
        set1.insert(card1)
      }
    }

    XCTAssertEqual(set1.count, deck2.count)

    for _ in 0..<deck2.count {
      if let card2 = deck2.deal() {
        XCTAssert(set1.contains(card2))
      }
    }
  }
}
