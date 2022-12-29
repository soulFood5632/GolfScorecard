//
//  Position.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2022-12-15.
//

import Foundation

public struct Position: Equatable {
    
    private let distance: Int
    private let lieType : Lie
    
    
    public init(distance: Int, lieType: Lie) {
        self.distance = distance
        self.lieType = lieType
    }
    
    
    /**
     Gets the expected shots to hole out based on the PGA tour benchmark
     */
    public func getExpectedShots() -> Double{
        switch lieType {
        case Lie.tee:
            return 0
        case Lie.fairway:
            return 0
        case Lie.recovery:
            return 0
        case Lie.rough:
            return 0
        case Lie.bunker:
            return 0
        case Lie.green:
            return 0
        case Lie.hazard:
            return 0
        case Lie.holed:
            return 0

        }
    }
    
    
    /**
     Gets a holed out position.
     */
    public static func holedOut() -> Position {
        return Position(distance: 0, lieType: Lie.holed)
    }
    
    /**
     Gets the lie of this position.
     */
    public func getLie() -> Lie {
        return lieType
    }
    
    /**
     Gets the distance of this position
     */
    public func getDistance() -> Int {
        return distance
    }
    
    /**
     Equals method for this dataType
     */
    public static func == (lhs: Position, rhs: Position) -> Bool {
        return lhs.getLie() == rhs.getLie() && lhs.getDistance() == rhs.getDistance()
    }
    
}

public enum Lie {
    case holed
    case tee
    case fairway
    case rough
    case recovery
    case bunker
    case green
    case hazard
}

