//
//  Block.swift
//  Swiftris
//
//  Created by Ørjan Monsen on 2016-03-05.
//  Copyright © 2016 Ørjan Monsen. All rights reserved.
//

import Foundation
import SpriteKit

// Define # of colours available
let NumberOfColors: UInt32 = 6

// declare enum of type int that implements CustomStringConvertible
enum BlockColor: Int, CustomStringConvertible {
    
    // Provide full list of enum options
    case Blue = 0, Orange, Purple, Red, Teal, Yellow
    
    // define compute property: create spriteName and determine its enum colour
    var spriteName: String {
        switch self {
        case .Blue:
            return "blue"
        case .Orange:
            return "orange"
        case .Purple:
            return "purple"
        case .Red:
            return "red"
        case .Teal:
            return "teal"
        case .Yellow:
            return "yellow"
        }
    }
    
    // define compute property: description
    var description: String {
        return self.spriteName
    }
    
    // function that returns a random block colour
    static func random() -> BlockColor {
        return BlockColor(rawValue:Int(arc4random_uniform(NumberOfColors)))!
    }
    
}
    // declare block class
    class Block: Hashable, CustomStringConvertible {
        // #8
        // define color as Constant (unchangeable once it's set)
        let color: BlockColor
        
        // #9
        // Properties
        var column: Int // column location in array
        var row: Int    //    row location in array
        var sprite: SKSpriteNode? //visual element of the block
        
        // get spriteName
        var spriteName: String {
            return color.spriteName
        }
        
        // hashValue calculated property (required by Hashable)
        // return XOr(row,col) to generate a unique int for each block
        var hashValue: Int {
            return self.column ^ self.row
        }
        
        // toString: print objects by using \(object_name)
        var description: String {
            return "\(color): [\(column), \(row)]"
        }
        
        // constructor: initialise
        init(column:Int, row:Int, color:BlockColor) {
            self.column = column
            self.row = row
            self.color = color
        }
}

// Create a custom operator
// Returns true if both blocks are in the same location AND of the same color
func ==(lhs: Block, rhs: Block) -> Bool {
    return lhs.column == rhs.column && lhs.row == rhs.row && lhs.color.rawValue == rhs.color.rawValue
}
