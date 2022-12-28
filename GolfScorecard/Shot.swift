//
//  Shot.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2022-12-15.
//

import Foundation

struct Shot: Equatable{
    private let startPos: Position
    private let endPos: Position
    private let shotType: ShotType
    
    init(startPos: Position, endPos: Position) {
        self.startPos = startPos
        self.endPos = endPos
        if startPos.getLie() == Lie.tee {
            shotType = ShotType.drive
        } else if startPos.getLie() == Lie.hazard {
            shotType = ShotType.penalty
        } else if startPos.getLie() == Lie.green {
            shotType = ShotType.putt
        } else {
            shotType = ShotType.shot
        }
        
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
        return startPos.getExpectedShots()
    }
    
    /**
     Gets the expected value to hole out from the ending position position
     */
    public func getAfterExpectedShots() -> Double {
        if endPos.getLie() == Lie.hazard {
            //TODO: Deal with this special case
        }
        return endPos.getExpectedShots()
    }
    
    /**
     Gets the shots gained value of this shot. 
     */
    
    public func getShotsGained() -> Double {
        return getAfterExpectedShots() - getPriorExpectedShots() - 1
    }
    
    /**
     Equals method for this dataType
     */
    public static func == (lhs: Shot, rhs: Shot) -> Bool {
        return lhs.getStart() == rhs.getStart() && lhs.getEnd() == rhs.getEnd()
    }
    
}



public enum ShotType{
    case drive
    case shot
    case putt
    case penalty
}
