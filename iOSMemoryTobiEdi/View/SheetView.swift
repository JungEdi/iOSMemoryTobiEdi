//
//  SheetView.swift
//  iOSMemoryTobiEdi
//
//  Created by Tobi Wyss on 13.10.22.
//

import SwiftUI

struct SheetView: View {

    @ObservedObject
    var viewModel: StartGameViewModel

    private var selectedGameType: GameType {
        viewModel.gameType
    }
   private var selectedDifficulty: Difficulty {
        viewModel.difficulty
    }

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
        }
            .font(.title)
    }

    private func GameTypePicker() -> some View {
        VStack {
            Text("Welches Kartenset möchtest du spielen?")
            Picker("Spieltypen", selection: $viewModel.gameType) {
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
            Picker("Schwierigkeit", selection: $viewModel.difficulty) {
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
        SheetView(viewModel: StartGameViewModel())
    }
}



