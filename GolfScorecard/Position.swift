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
    

    
    
    
    
    
}

enum Lie {
    case tee
    case fairway
    case rough
    case recovery
    case bunker
    case green
}

