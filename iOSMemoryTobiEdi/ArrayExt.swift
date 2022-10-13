//
//  ArrayExt.swift
//  MemoryGame
//
//  Created by Tobi Wyss on 13.10.22.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndx(matching second: Element) -> Int?{
        for index in 0..<self.count {
            if self[index].id == second.id{
                return index
            }
        }
        return nil
    }
}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
