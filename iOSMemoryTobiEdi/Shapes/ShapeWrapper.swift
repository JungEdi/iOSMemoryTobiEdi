//
// Created by Tobi Wyss on 03.11.22.
//

import SwiftUI

struct ShapeWrapper: Equatable {
    static func ==(lhs: ShapeWrapper, rhs: ShapeWrapper) -> Bool {
        lhs.id == rhs.id
    }

    let id: Int
    let shape: any View
}