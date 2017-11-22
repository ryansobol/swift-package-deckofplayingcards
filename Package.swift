// swift-tools-version:4.0

import PackageDescription

let package = Package(
  name: "DeckOfPlayingCards",
  products: [
    .library(name: "DeckOfPlayingCards", targets: ["DeckOfPlayingCards"]),
  ],
  dependencies: [
    .package(
      url: "https://github.com/ryansobol/swift-package-fisheryates.git",
      .branch("master")
    ),
    .package(
      url: "https://github.com/ryansobol/swift-package-playingcard.git",
      .branch("master")
    ),
  ],
  targets: [
    .target(
      name: "DeckOfPlayingCards",
      dependencies: ["FisherYates", "PlayingCard"]
    ),
    .testTarget(
      name: "DeckOfPlayingCardsTests",
      dependencies: ["DeckOfPlayingCards"]
    ),
  ]
)
