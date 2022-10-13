//
//  iOSMemoryTobiEdiApp.swift
//  iOSMemoryTobiEdi
//
//  Created by Tobi Wyss on 13.10.22.
//

import SwiftUI

@main
struct iOSMemoryTobiEdiApp: App {
    var body: some Scene {
        WindowGroup {
            MemoryGameView(viewModel: EmojiMemoryGameViewModel())
        }
    }
}
