//
//  Golfer.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2022-12-16.
//

import Foundation

class Golfer {
    private var handicap: Double?
    private var roundList: [Round]
    private var differentialList: [(Double, Date)]
    public var nickname: String
    public var password: String
    public var userID: String
    
    private let DEFAULT_HANDICAP: Double = 36.0
    
    init(userID: String, nickname: String, password: String) {
        self.handicap = DEFAULT_HANDICAP
        roundList = [Round]()
        differentialList = [(Double, Date)]()
        self.nickname = nickname
        self.password = password
        self.userID = userID
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
        differentialList.append((roundToAdd.getDifferential(), roundToAdd.getDate()))
        handicap = nil
    }
    
    /**
     Gets the handicap of this user
     */
    public func getHandicap() -> Double {
        if handicap != nil {
            return handicap ?? DEFAULT_HANDICAP
        }
        differentialList.sort(by: { (element1, element2) in return Golfer.compareDate(element1: element1, element2: element2) }) //sorts the elements in the differential list
        switch differentialList.count {
        case 0, 1, 2:
            return DEFAULT_HANDICAP
        case 3:
            return Golfer.getAverageOfList(list: getTopNDifferentials(howManyScores: 1)) - 2
        case 4:
            return Golfer.getAverageOfList(list: getTopNDifferentials(howManyScores: 1)) - 1
        case 5:
            return Golfer.getAverageOfList(list: getTopNDifferentials(howManyScores: 1))
        case 6:
            return Golfer.getAverageOfList(list: getTopNDifferentials(howManyScores: 2)) - 1
        case 7, 8:
            return Golfer.getAverageOfList(list: getTopNDifferentials(howManyScores: 2))
        case 9, 10, 11:
            return Golfer.getAverageOfList(list: getTopNDifferentials(howManyScores: 3))
        case 12, 13, 14:
            return Golfer.getAverageOfList(list: getTopNDifferentials(howManyScores: 4))
        case 15, 16:
            return Golfer.getAverageOfList(list: getTopNDifferentials(howManyScores: 5))
        case 17, 18:
            return Golfer.getAverageOfList(list: getTopNDifferentials(howManyScores: 6))
        case 19:
            return Golfer.getAverageOfList(list: getTopNDifferentials(howManyScores: 7))
        default:
            return Golfer.getAverageOfList(list: getTopNDifferentials(howManyScores: 8))
            
            
            
        }
        
    }
    
    /**
     Gets the average of this list. Requires the list be non-empty
     */
    private static func getAverageOfList(list: [Double]) -> Double {
        return list.reduce(0) { $0 + $1 } / Double(list.count)
    }
    
    /**
     Gets the top N differntials from the given list. If the differntial list's
     size is greater than 20 it will cut off to the most recent rounds.
     */
    private func getTopNDifferentials(howManyScores: Int) -> [Double] {
        var updatedList = differentialList
        if updatedList.count > 20 {
            updatedList.remove(atOffsets: IndexSet(20...updatedList.count - 1))
        }
        
       var numericalList = updatedList.map { (differential, date) in return differential }
        
        if howManyScores >= numericalList.count {
            return numericalList
        }
        numericalList.sort(by: { (element1, element2) in return element1 > element2 })
        
        return Golfer.cutOffList(list: numericalList, indexToBeRemovedAfter: howManyScores)
    
        
    }
    
    /**
     Returns a list of any object with all elements removed after the specified index.
     If the list size is too small to be cut off it returns the same list
     */
    private static func cutOffList(list: [Double], indexToBeRemovedAfter: Int) -> [Double] {
        if indexToBeRemovedAfter > list.count - 1 {
            return list
        }
        var indexSet = IndexSet(indexToBeRemovedAfter...list.count - 1)
        var copyOfList = list
        copyOfList.remove(atOffsets: indexSet)
        return copyOfList
    }
    
    
    /**
     Compares dates in the differential List
     */
    private static func compareDate(element1: (Double, Date), element2: (Double, Date)) -> Bool {
        switch element1.1.compare(element2.1) {
        case ComparisonResult.orderedAscending:
            return false
        case ComparisonResult.orderedSame:
            return false
        case ComparisonResult.orderedDescending:
            return true
            
        }
        
        //TODO: ensure that this not flipped
    }
    
    /**
     Gets the number of unique courses this golfer has played
     */
    
    public func getNumberOfCourses() -> Int {
        return Set(roundList.map{ round in round.getCourseName() }).count
    }
    
    public func getMostCommonCourse() -> Course {
        return Course.sampleCourseInfo
        //TODO: implement this method
    }
    
    
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
        let totalScore = roundList.map { round in round.getScore()}.reduce(0) { $0 + $1 }
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
