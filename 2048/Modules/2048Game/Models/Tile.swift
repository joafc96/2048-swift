//
//  Tile.swift
//  2048
//
//  Created by qbuser on 07/12/22.
//

import Foundation

struct Tile<T: Evolvable>: CustomStringConvertible {
    let value: T
    let position: Coordinate
    
    var description: String {
        get {
            return "Tile(value: \(value), position: \(position))"
        }
    }
}
