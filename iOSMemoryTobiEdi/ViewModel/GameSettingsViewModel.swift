//
//  GameSettingsViewModel.swift
//  iOSMemoryTobiEdi
//
//  Created by Edi Jung on 02.11.22.
//

import Foundation

class GameSettingsViewModel: ObservableObject {

    @Published private var model: StartGameModel

    init() {
        model = StartGameModel()
    }


    // MARK: - Access to the Model
    var difficulty: Difficulty {
        get {
            model.difficulty
        }
        set {
            model.difficulty = newValue
        }
    }

    var gameType: GameType {
        get {
            model.gameType
        }
        set {
            model.gameType = newValue
        }
    }
}
