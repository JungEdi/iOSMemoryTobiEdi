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

        Button("Start") {
            dismissSheet()
            viewModel.gameType = selectedGameType
            viewModel.difficulty = selectedDifficulty
        }
            .font(.title)
    }

    private func GameTypePicker() -> some View {
        VStack {
            Text("Welches Kartenset möchtest du spielen?")
            Picker("Spieltypen", selection: $selectedGameType) {
                ForEach(GameType.allCases) { gameType in
                    Text(gameType.rawValue)
                }
            }
                .pickerStyle(.segmented).padding(10)
        }
    }

    private func DifficultyPicker() -> some View {
        VStack {
            Text("Wähle den Schwierigkeitsgrad aus:")
            Picker("Schwierigkeit", selection: $selectedDifficulty) {
                ForEach(Difficulty.allCases) { difficulty in
                    Text(difficulty.rawValue)
                }
            }
        }
            .pickerStyle(.segmented).padding(10)

    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView(viewModel: GameSettingsViewModel())
    }
}



