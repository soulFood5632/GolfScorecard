//
//  Position.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2022-12-15.
//

import Foundation

struct Position {
    
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
            
        case Lie.recovery:
            
        case Lie.rough:
            
        case Lie.bunker:
            
        case Lie.green:
            
        case Lie.hazard:
            

        }
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
    
}

enum Lie {
    case tee
    case fairway
    case rough
    case recovery
    case bunker
    case green
    case hazard
}

