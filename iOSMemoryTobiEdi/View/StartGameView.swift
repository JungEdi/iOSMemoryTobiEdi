//
//  StartGameView.swift
//  iOSMemoryTobiEdi
//
//  Created by Edi Jung on 02.11.22.
//

import SwiftUI

struct StartGameView: View {
    @ObservedObject
    var viewModel = GameSettingsViewModel()
    @State private var showingSheet = false
    
    var score = UserDefaults.standard.integer(forKey: "Score")
    
    var body: some View {
        NavigationView {
            VStack {
                Text("\(highScore) \(score)")
                Spacer()
                Text("\(mode) \(viewModel.gameType.rawValue)")
                Text("\(difficulty) \(viewModel.difficulty.rawValue)")
                Spacer()
                MenuSheetButton()
                Spacer()
                NavigationLink(destination: GameView(viewModel: viewModel)) {
                    Text(startGame)
                }
                Spacer()
            }
        }
    }


    private func MenuSheetButton() -> some View {
        Button(changeSettings) {
            showingSheet.toggle()
        }
            .sheet(isPresented: $showingSheet) {
                SheetView(viewModel: viewModel)
            }
    }

    private func toggleSheet() -> Void {
        showingSheet.toggle();
    }

    // MARK - Text constants
    private let changeSettings = "Change Settings"
    private let startGame = "Start Game"
    private let difficulty = "Schwierigkeit:"
    private let emojiSet = "EmojiSet:"
    private let mode = "Modus:"
    private let highScore = "High Score:"

}

struct StartGameView_Previews: PreviewProvider {
    static var previews: some View {
        StartGameView()
    }
}
