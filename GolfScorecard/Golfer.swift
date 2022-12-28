//
//  Golfer.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2022-12-16.
//

import Foundation

class Golfer{
    private var handicap: Double
    private var roundList: [Round]
    private var differentialList: [Double]
    
    private let DEFAULT_HANDICAP: Double = 36.0
    
    init() {
        self.handicap = DEFAULT_HANDICAP
        roundList = [Round]()
        differentialList = [Double]()
    }
    
    
    
    /**
     Gets the handicap of this user
     */
    public func getHandicap() -> Double {
        return handicap
    }
    
    /**
     Adds a round to the user's history
     */
    public func addRound(roundToAdd: Round) {
        roundList.append(roundToAdd)
//        addToHandicapCalc(differential: roundToAdd.getScorecard().getDifferential())
    }
    
    
    
    // TODO: Do all the stuff for reports:
    // overload getReport with all possible filters. Also explore the possibility of nested Filter. Think a new filter object
    
    
    
}
