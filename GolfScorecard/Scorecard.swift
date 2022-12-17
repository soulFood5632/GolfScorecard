//
//  Scorecard.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2022-12-15.
//

import Foundation

struct Scorecard {
    
    
    private let holes: [Hole]
    
    /**
     Init for a scorecard.
     
     Requires: An 18 hole list of Hole's
     */
    
    init(holes: [Hole]) {
        self.holes = holes
        
    }
    
    
    
    /**
     Finds the score of the player over the 18 holes
     */
    
    public func getScore() -> Int {
        var totalScore = 0
        for hole in holes {
            totalScore += hole.getScore()
        }
        return totalScore
    }
    
    
    
    
}
