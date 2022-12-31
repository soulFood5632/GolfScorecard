//
//  Golfer.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2022-12-16.
//

import Foundation

class Golfer {
    private var handicap: Double
    private var roundList: [Round]
    private var differentialList: [Double]
    public var nickname: String
    public var password: String
    public var userID: String
    
    private let DEFAULT_HANDICAP: Double = 36.0
    
    init(userID: String, nickname: String, password: String) {
        self.handicap = DEFAULT_HANDICAP
        roundList = [Round]()
        differentialList = [Double]()
        self.nickname = nickname
        self.password = password
        self.userID = userID
    }
    
    
    
    
    
    /**
     Gets the handicap of this user
     */
    public func getHandicap() -> Double {
        return handicap
    }
    
    
    /**
     Gets the number of rounds played by this golfer
     */
    public func getNumberOfRounds() -> Int {
        return roundList.count
    }
    
    
    
    /**
     Gets the list of all rounds played by this golfer
     */
    public func getRounds() -> [Round] {
        return roundList
    }
    
    /**
     Adds a round to the user's history
     */
    public func addRound(roundToAdd: Round) {
        roundList.append(roundToAdd)
//        addToHandicapCalc(differential: roundToAdd.getScorecard().getDifferential())
    }
    
    /**
     Gets the number of unique courses this golfer has played
     */
    
    public func getNumberOfCourses() -> Int {
        return Set(roundList.map{ round in round.getCourseName() }).count
    }
    
//    public func getMostCommonCourse() -> Course {
//        
//    }
    
    
    /**
     Gets the low round of this golfer. The user must have at least one round.
     */
    public func getLowRound() -> Int {
        var lowRound = roundList[0].getScore()
        
        for round in roundList {
            if lowRound > round.getScore() {
                lowRound = round.getScore()
            }
        }
        
        return lowRound
    }
    
    /**
     Gets the scoring average of this golfer. The user must have at least one round.
     */
    
    public func scoringAverage() -> Float {
        var totalScore = roundList.map { round in round.getScore()}.reduce(0) { $0 + $1 }
        
        return Float(totalScore) / Float(roundList.count)
    }
    
    
    
    // TODO: Do all the stuff for reports:
    // overload getReport with all possible filters. Also explore the possibility of nested Filter. Think a new filter object
    
    
    
}

extension Golfer {
    static var sampleGolfer: Golfer {
        var myGolfer = Golfer(userID: "loganu13", nickname: "Logan Underwood", password: "Magenta^2")
        myGolfer.addRound(roundToAdd: Round.exampleRound)
        return myGolfer
    }
    
}
