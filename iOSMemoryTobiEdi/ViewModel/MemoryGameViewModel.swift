//
//  ViewMOdel.swift
//  iOSMemoryTobiEdi
//
//  Created by Tobi Wyss on 15.10.22.
//

import Foundation

protocol MemoryGameViewModel : ObservableObject {
    var gameStarted: Bool { get set }
}
