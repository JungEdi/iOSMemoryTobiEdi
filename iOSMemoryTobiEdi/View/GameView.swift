//
// Created by Tobi Wyss on 03.11.22.
//

import SwiftUI

struct GameView: View {
    @ObservedObject
    var viewModel: GameSettingsViewModel
    @State private var showingSheet = false

    var body: some View {
        VStack {
            Game()
            NewGameSheetButton()
        }
    }

    private func Game() -> some View {
        switch viewModel.gameType {
        case .emoji:
            return AnyView(EmojiMemoryGameView(
                viewModel: EmojiMemoryGameViewModel(
                    difficulty: viewModel.difficulty)))
        case .shapes:
            return AnyView(ShapeMemoryGameView(
                viewModel: ShapeMemoryGameViewModel(
                    difficulty: viewModel.difficulty)
            ))
        }
    }


    private func NewGameSheetButton() -> some View {
        Button("New Game") {
            showingSheet.toggle()
        }
            .sheet(isPresented: $showingSheet) {
                SheetView(viewModel: viewModel)
            }
    }
}

