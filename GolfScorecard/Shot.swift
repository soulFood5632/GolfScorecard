//
//  Shot.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2022-12-15.
//

import Foundation

struct Shot{
    private let startPos: Position
    private let endPos: Position
    private let shotType: ShotType
    
    init(startPos: Position, endPos: Position, shotType: ShotType) {
        self.startPos = startPos
        self.endPos = endPos
        self.shotType = shotType
        
    }
    
}



enum ShotType{
    case drive
    case shot
    case putt
}
