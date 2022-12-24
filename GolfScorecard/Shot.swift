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
    
    /**
     Gets the shot type
     */
    
    public func getShotType() -> ShotType {
        return shotType
    }
    
    /**
     Gets the the position where the shot started from
     */
    public func getStart() -> Position {
        return startPos
    }
    
    /**
     Gets the position where the shot finished
     */
    public func getEnd() -> Position {
        return endPos
    }
    
    /**
     Gets the expected value to hole out from the starting position
     */
    public func getPriorExpectedShots() -> Double {
        return 0
    }
    
    /**
     Gets the expected value to hole out from the ending position position
     */
    public func getAfterExpectedShots() -> Double {
        return 0
    }
    
    /**
     Gets the shots gained value of this shot. 
     */
    
    public func getShotsGained() -> Double {
        return getAfterExpectedShots() - getPriorExpectedShots() - 1
    }
    
}



public enum ShotType{
    case drive
    case shot
    case putt
    case penalty
}
