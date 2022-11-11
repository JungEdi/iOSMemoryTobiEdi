//
// Created by Tobi Wyss on 03.11.22.
//

import Foundation
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
