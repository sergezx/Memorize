//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Sergey on 17.11.2022.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
