//
//  StartGameViewModel.swift
//  iOSMemoryTobiEdi
//
//  Created by Edi Jung on 02.11.22.
//

import Foundation

class StartGameViewModel: ObservableObject {

    @Published private var model: StartGameModel

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

    init() {
        model = StartGameModel()
    }
}
