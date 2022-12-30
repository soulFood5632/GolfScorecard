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
    private let penalty: Penalty
    
    init(startPos: Position, endPos: Position) {
        self.startPos = startPos
        self.endPos = endPos
        if startPos.getLie() == Lie.tee {
            shotType = ShotType.drive
        } else if startPos.getLie() == Lie.hazard {
            fatalError("Hazard Lie is not a valid start Position")
        } else if startPos.getLie() == Lie.green {
            shotType = ShotType.putt
        } else {
            shotType = ShotType.shot
        }
        
        penalty = Penalty.NoPenalty
        
    }
    
    
    init(startPos: Position, endPos: Position, penaltyType: Penalty) {
        self.startPos = startPos
        self.endPos = endPos
        switch startPos.getLie() {
        case Lie.tee:
            if startPos.getDistance() > 255 { //cutoff for what is a tee shot
                shotType = ShotType.drive
            } else {
                shotType = ShotType.approach
            }
            break
        case Lie.fairway:
            if startPos.getDistance() > 50 { //cuttoff for approach shot
                shotType = ShotType.approach
            } else {
                shotType = ShotType.chip
            }
            break
        case Lie.bunker:
            if startPos.getDistance() > 50 { //cuttoff for approach shot
                shotType = ShotType.approach
            } else {
                shotType = ShotType.sand
            }
            break
        case Lie.hazard:
            fatalError("No start posotion to a swing can be in a hazard")
        case Lie.holed:
            fatalError("No start position can be in the hole")
            
        
        
        
        }
        
        self.penalty = penaltyType
        
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
    case approach
    case chip
    case sand
    case putt
}
