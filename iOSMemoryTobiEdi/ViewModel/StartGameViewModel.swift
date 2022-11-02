//
//  StartGameViewModel.swift
//  iOSMemoryTobiEdi
//
//  Created by Edi Jung on 02.11.22.
//

import Foundation

class StartGameViewModel : ObservableObject {
    
    @Published private var model: StartGameModel
    
    init() {
        model = StartGameModel(difficultyLevel: 0, gameModus: 0)
    }
    
    func setDifficultyLevel(difficultyLevel: Int){
        model.difficultyLevel = difficultyLevel
    }
    func getDifficultyLevel() -> Int{
        return model.difficultyLevel
    }
    
    func setGameModus(gameModus: Int){
        model.gameModus = gameModus
    }
    func getGameModus() -> Int{
        return model.gameModus
    }
}
