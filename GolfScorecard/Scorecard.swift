//
//  Scorecard.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2022-12-15.
//

import Foundation

class Scorecard {
    
    
    private var scoreCard: [Int: Hole]
    
    /**
     Init for a scorecard including the set of holes. The holes must be in order
     */
    init(holes: [Hole]) {
        var number = 1
        scoreCard = [Int: Hole]()
        for hole in holes {
            scoreCard[number] = hole
        }
    }
    
    /**
    Init for scorecard that does not include entry of any holes
     */
    init(){
        scoreCard = [Int: Hole]()
    }
    
    
    
    /**
     Adds a hole if one does not already exist at that number. Returns true if succseful false otherwise.
     Hole number must be between 1 and 18.
     */
    public func addHole(holeNumber: Int, holeEntry: Hole) -> Bool {
        if scoreCard[holeNumber] != nil{
            return false
        }
        scoreCard[holeNumber] = holeEntry
        return true
    }
    
    /**
     Overwrites the hole prevously in the spot. If none already it exists it adds it anyway. Hole number must be between 1 and 18.
     */
    public func overwriteHole(holeNumber: Int, holeEntry: Hole) {
        scoreCard[holeNumber] = holeEntry
    }
    
    
    /**
     Finds the score of the player over the 18 holes
     */
    public func getScore() -> Int {
        var totalScore = 0
        for (_, holeEntry) in scoreCard {
            totalScore += holeEntry.getScore()
        }
        return totalScore
    }
    
    /**
     Gets a list of all the shots from the specified hole.
     Throws HoleNotFound exception of no hole exsits 
     */
    public func getShotsFromHole(holeNum: Int) throws -> [Shot] {
        if let listOfShots = scoreCard[holeNum]?.getShots() {
            return listOfShots
        }
        throw IllegalArgument.NoHoleExists
    }
    
    
    /**
     Gets a list of all shots from the round
     */
    public func getAllShots() -> [Shot] {
        var totalListofShots = [Shot]()
        for (_, holeEntry) in scoreCard {
            for shot in holeEntry.getShots() {
                totalListofShots.append(shot)
            }
        }
        
        return totalListofShots
    }
    
    
}

public enum IllegalArgument: Error {
    case NoHoleExists
}
