//
//  SheetView.swift
//  iOSMemoryTobiEdi
//
//  Created by Tobi Wyss on 13.10.22.
//

import SwiftUI

struct SheetView: View {
  let viewModel: StartGameViewModel
  @State private var selectedGameType: GameType = .emoji
  @State private var selectedDifficulty: Difficulty = .medium

  @Environment(\.dismiss) var dismissSheet

  var body: some View {
      NavigationView {
        VStack {
          Spacer()
          GameTypePicker()
          DifficultyPicker()
          Spacer()
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
    SheetView(viewModel: StartGameViewModel())
  }
}


enum GameType: String, CaseIterable, Identifiable {
  case emoji, shapes
  var id: Self {
    self
  }
}

enum Difficulty: String, CaseIterable, Identifiable {
  case easy, medium, hard
  var id: Self {
    self
  }
}
