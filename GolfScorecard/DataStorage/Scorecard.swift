//
//  Scorecard.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2022-12-15.
//

import Foundation

class Scorecard {
    
    
    private var scoreCard: [Int: Hole]
    private var slope: Int
    private var rating: Float
    private var confirmed: Bool
    
    private var cachedScore: Int?
    private var cachedShots: [Shot]?
    private var cachedPar: Int?
    
    
    
    
    /**
    Init for scorecard requriing a triple of slope, rating, then hole by hole info
     */
    init(courseTemplate: (Int, Float, [HoleInfo])){
        var index = 1
        
        self.slope = courseTemplate.0
        self.rating = courseTemplate.1
        
        self.scoreCard = [Int: Hole]()
        
        for infoHole in courseTemplate.2 {
            scoreCard[index] = Hole(holeInfo: infoHole)
            index += 1
        }
        
        self.confirmed = false
    }
    
    /**
     Gets information on this hole.
     */
    public func getHole(holeNum: Int) throws -> Hole {
        
        if let hole = scoreCard[holeNum] {
            return hole
        }
        throw RetreivalError.NoHoleExists
        
    }
    
    /**
     Gets the set of holes in list format
     */
    public func getAllHoles() -> [Int: Hole] {
        return scoreCard
    }
    
    
    
    /**
     Adds a hole if one does not already exist at that number. Returns true if succseful false otherwise.
     If Hole number is not between 1 and 18, throws NoHoleFound Error
     Throws RoundIsLocked error if the round has been locked
     */
    public func addHole(holeNumber: Int, holeEntry: Hole) throws -> Bool {
        if isLocked(){
            throw Locked.RoundIsLocked
        }
        if holeNumber < 1 || holeNumber > 18 {
            throw RetreivalError.NoHoleExists
        }
        if scoreCard[holeNumber] != nil{
            return false
        }
        scoreCard[holeNumber] = holeEntry
        return true
    }
    
    /**
     Overwrites the hole prevously in the spot. If none already it exists it adds it anyway. Hole number must be between 1 and 18.
     */
    public func overwriteHole(holeNumber: Int, holeEntry: Hole) throws {
        if isLocked(){
            throw Locked.RoundIsLocked
        }
        if holeNumber < 1 || holeNumber > 18 {
            throw RetreivalError.NoHoleExists
        }
        scoreCard[holeNumber] = holeEntry
    }
    
    
    /**
     Finds the score of the player over the total round
     */
    public func getScore() -> Int {
        if isLocked() {
            if cachedScore != nil {
                return cachedScore ?? -1
            }
            cachedScore = calculateScore()
            return cachedScore ?? -1 
        }
        return calculateScore()
        
    }
    
    
    /**
     Finds the par of this round
     */
    public func getPar() -> Int {
        if isLocked() {
            if cachedPar != nil {
                return cachedPar ?? -1
            }
            cachedPar = calculatePar()
            return cachedPar ?? -1
        }
        return calculatePar()
    }
    
    /**
     Caculates the par of this round
     */
    private func calculatePar() -> Int {
        var totalPar = 0
        for (_, holeEntry) in scoreCard {
            totalPar += holeEntry.getHoleInfo().getPar()
        }
        return totalPar
    }
    
    public func getScoreToPar() -> Int {
        return getScore() - getPar()
    }
    
    
    
    
    /**
     Calculates the score of the round given the current state.
     */
    private func calculateScore() -> Int {
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
        throw RetreivalError.NoHoleExists
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
    
    public func isLocked() -> Bool {
        return confirmed
    }
    
    public func lockRound() {
        confirmed = true
    }
    
    public func unlockRound() {
        cachedScore = nil
        cachedShots = nil
        confirmed = false
    }
    
    public func getDifferential() -> Double {
        return (113 / Double(self.slope)) * Double(Float(getScore()) - self.rating)
    }
        
    
}

public enum Locked: Error{
    case RoundIsLocked
}
            
            


