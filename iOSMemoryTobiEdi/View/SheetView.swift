//
//  SheetView.swift
//  iOSMemoryTobiEdi
//
//  Created by Tobi Wyss on 13.10.22.
//

import SwiftUI

struct SheetView: View {

    @ObservedObject
    var viewModel: GameSettingsViewModel

    // The state is written to the model as soon, as the  "Startgame" button is pressed, otherwise there will be no card shuffle animation
    @State private var selectedGameType: GameType = GameType.emoji
    @State private var selectedDifficulty: Difficulty = Difficulty.medium

    @Environment(\.dismiss) var dismissSheet

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                GameTypePicker()
                DifficultyPicker()
                Spacer()
                StartButton()
            }
        }
    }

    private func StartButton() -> some View {

        Button(start) {
            dismissSheet()
            viewModel.gameType = selectedGameType
            viewModel.difficulty = selectedDifficulty
        }
            .font(.title)
    }

    private func GameTypePicker() -> some View {
        VStack {
            Text(chooseGameType)
            Picker(gameType, selection: $selectedGameType) {
                ForEach(GameType.allCases) { gameType in
                    Text(gameType.rawValue)
                }
            }
                .pickerStyle(.segmented).padding(pickerPadding)
        }
    }

    private func DifficultyPicker() -> some View {
        VStack {
            Text(chooseDifficultyLevel)
            Picker(difficulty, selection: $selectedDifficulty) {
                ForEach(Difficulty.allCases) { difficulty in
                    Text(difficulty.rawValue)
                }
            }
        }
            .pickerStyle(.segmented).padding(pickerPadding)

    }


    // MARK - Drawing constants
    private let pickerPadding = Double(10)

    // MARK - Text constants
    private let chooseDifficultyLevel = "Wähle den Schwierigkeitsgrad aus:"
    private let difficulty = "Schwierigkeit"
    private let chooseGameType = "Welches Kartenset möchtest du spielen?"
    private let gameType = "Spieltypen"
    private let start = "Start"
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView(viewModel: GameSettingsViewModel())
    }
}



