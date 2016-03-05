//
//  LineShape.swift
//  Swiftris
//
//  Created by Ørjan Monsen on 2016-03-05.
//  Copyright © 2016 Ørjan Monsen. All rights reserved.
//

import Foundation
class LineShape:Shape {
/*
Orientations 0 and 180:

| 0•|
| 1 |
| 2 |
| 3 |

Orientations 90 and 270:

| 0 | 1•| 2 | 3 |

• marks the row/column indicator for the shape

*/

// Hinges about the second block

    // dictionary. since it hinges about the 2nd block, we have to set the first entry as -1
    override var blockRowColumnPositions: [Orientation: Array<(columnDiff: Int, rowDiff: Int)>] {
        return [
            Orientation.Zero:       [(0, 0), (0, 1), (0, 2), (0, 3)],
            Orientation.Ninety:     [(-1,0), (0, 0), (1, 0), (2, 0)],
            Orientation.OneEighty:  [(0, 0), (0, 1), (0, 2), (0, 3)],
            Orientation.TwoSeventy: [(-1,0), (0, 0), (1, 0), (2, 0)]
        ]
    }
    // dictionary:
    override var bottomBlocksForOrientations: [Orientation: Array<Block>] {
        return [
            Orientation.Zero:       [blocks[FourthBlockIdx]],
            Orientation.Ninety:     blocks,
            Orientation.OneEighty:  [blocks[FourthBlockIdx]],
            Orientation.TwoSeventy: blocks
        ]
    }
}