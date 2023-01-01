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
    private var courseMap: [Course: Int]
    public var nickname: String
    public var password: String
    public var userID: String
    
    private let DEFAULT_HANDICAP: Double = 36.0
    private var mostPopularCourse: Course?
    
    init(userID: String, nickname: String, password: String) {
        self.handicap = DEFAULT_HANDICAP
        roundList = [Round]()
        courseMap = [Course: Int]()
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
     Gets a round of a particular ID. Throws a roundNotFound exception if a round
     of that ID does not exist
     */
    public func getRound(roundID: UUID) throws -> Round {
        if doesRoundExist(roundID: roundID) {
            return roundList.filter( {$0.getRoundID() == roundID})[0]
        }
        throw RetreivalError.NoRoundExists
    }
    
    /**
     Adds a round to the user's history. Returns false if the round has already been added.
     */
    public func addRound(roundToAdd: Round) -> Bool {
        if doesRoundExist(roundToCheck: roundToAdd) {
            return false
        }
        roundList.append(roundToAdd)
        resetCache()
        
        if let _ = courseMap[roundToAdd.getCourse()] {
            courseMap[roundToAdd.getCourse()]! += 1
        }
        
        courseMap[roundToAdd.getCourse()] = 1
        
        return true
    }
    
    
    /**
     Checks to see if a round of the same ID already exists in this golfer
     */
    private func doesRoundExist(roundToCheck: Round) -> Bool {
        return roundList.contains(where: { round in return round.getRoundID() == roundToCheck.getRoundID()})
    }
    
    /**
     Checks to see if a id of the given round already exists in this golfer
     */
    private func doesRoundExist(roundID: UUID) -> Bool {
        return roundList.contains(where: { round in return round.getRoundID() == roundID})
    }
    
    /**
     Removes a round based on its ID, returns false if the ID does
     not exist in this round
     */
    public func removeRound(roundID: UUID) -> Bool {
        if doesRoundExist(roundID: roundID) {
            var courseToRemove: Course
            do {
                 courseToRemove = try getRound(roundID: roundID).getCourse()
            } catch {
                fatalError("Round has been confirmed to exist and then has been comfirmed to not in the same function")
            }
            roundList.removeAll(where: { $0.getRoundID() == roundID})
            
            courseMap[courseToRemove]! -= 1
            
            if courseMap[courseToRemove]! == 0 {
                courseMap.removeValue(forKey: courseToRemove)
            }
            
            return true
            
            
        } else {
            return false
        }
        
    }
    
    /**
     Removes the round from this user. returns false if this round did not exist
     */
    public func removeRound(round: Round) -> Bool {
        if doesRoundExist(roundToCheck: round) {
            var courseToRemove = round.getCourse()
            
            roundList.removeAll(where: { $0.getRoundID() == round.getRoundID()})
            
            courseMap[courseToRemove]! -= 1
            
            if courseMap[courseToRemove]! == 0 {
                courseMap.removeValue(forKey: courseToRemove)
            }
            
            return true
            
            
        } else {
            return false
        }
    }
    
    
    /**
     Resets all cached properties
     */
    private func resetCache() {
        handicap = nil
        mostPopularCourse = nil
        
    }
    
    /**
     Gets the handicap of this user
     */
    public func getHandicap() -> Double {
        if handicap != nil {
            return handicap ?? DEFAULT_HANDICAP
        }
        var differentialList = [(Double, Date)]()
        
        for round in self.roundList {
            differentialList.append((round.getDifferential(), round.getDate()))
        }
        
        differentialList = differentialList.sorted(by: { (element1, element2) in return Golfer.compareDate(element1: element1, element2: element2) }) //sorts the elements in the differential list
        
        var currentHandicap: Double
        switch differentialList.count {
        case 0, 1, 2:
            currentHandicap = DEFAULT_HANDICAP
        case 3:
            currentHandicap = Golfer.getAverageOfList(list: Golfer.getTopNDifferentials(differentialList: differentialList, howManyScores: 1)) - 2
        case 4:
            currentHandicap = Golfer.getAverageOfList(list: Golfer.getTopNDifferentials(differentialList: differentialList, howManyScores: 1)) - 1
        case 5:
            currentHandicap = Golfer.getAverageOfList(list: Golfer.getTopNDifferentials(differentialList: differentialList, howManyScores: 1))
        case 6:
            currentHandicap = Golfer.getAverageOfList(list: Golfer.getTopNDifferentials(differentialList: differentialList, howManyScores: 2)) - 1
        case 7, 8:
            currentHandicap = Golfer.getAverageOfList(list: Golfer.getTopNDifferentials(differentialList: differentialList, howManyScores: 2))
        case 9, 10, 11:
            currentHandicap = Golfer.getAverageOfList(list: Golfer.getTopNDifferentials(differentialList: differentialList, howManyScores: 3))
        case 12, 13, 14:
            currentHandicap = Golfer.getAverageOfList(list: Golfer.getTopNDifferentials(differentialList: differentialList, howManyScores: 4))
        case 15, 16:
            currentHandicap = Golfer.getAverageOfList(list: Golfer.getTopNDifferentials(differentialList: differentialList, howManyScores: 5))
        case 17, 18:
            currentHandicap = Golfer.getAverageOfList(list: Golfer.getTopNDifferentials(differentialList: differentialList, howManyScores: 6))
        case 19:
            currentHandicap = Golfer.getAverageOfList(list: Golfer.getTopNDifferentials(differentialList: differentialList, howManyScores: 7))
        default:
            currentHandicap = Golfer.getAverageOfList(list: Golfer.getTopNDifferentials(differentialList: differentialList,howManyScores: 8))
            break
        }
            
        
        handicap = currentHandicap
        
        return currentHandicap
        
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
    private static func getTopNDifferentials(differentialList: [(Double, Date)], howManyScores: Int) -> [Double] {
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
        return Set(roundList.map{ round in round.getCourse() }).count
    }
    
    /**
     Gets the most common course played. Requires that this golfer has played a
     course. If two courses are tied it returns a rondom course
     */
    public func getMostCommonCourse() -> Course {
        if mostPopularCourse != nil {
            return mostPopularCourse ?? Course.sampleCourseInfo
        }
        var mostCommonCourse: Course? = nil
        var currentMaxFrequency = 0
        for (course, frequency) in courseMap {
            if frequency > currentMaxFrequency {
                mostCommonCourse = course
                currentMaxFrequency = frequency
            }
            
        }
        
        mostPopularCourse = mostCommonCourse
        return mostCommonCourse ?? Course.sampleCourseInfo
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
    
    
    /**
     Gets the most recent round by this golfer. Requires the golfer to have a round
     */
    public func getLastRound() -> Round {
        var sortedList = roundList.sorted(by: {(elemnent1, element2) in
            switch elemnent1.getDate().compare(element2.getDate()) {
            case ComparisonResult.orderedAscending:
                return false
            case ComparisonResult.orderedSame:
                return false
            case ComparisonResult.orderedDescending:
                return true
            }
            
        })
        
        return sortedList[0]
    }
    
    
    
    // TODO: Do all the stuff for reports:
    // overload getReport with all possible filters. Also explore the possibility of nested Filter. Think a new filter object
    
    
    
}

extension Golfer {
    static var sampleGolfer: Golfer {
        let myGolfer = Golfer(userID: "loganu13", nickname: "Logan Underwood", password: "Magenta^2")
        myGolfer.addRound(roundToAdd: Round.exampleRound)
        return myGolfer
    }
    
    static var lazyGolfer: Golfer {
        let myGolfer = Golfer(userID: "NikYak67", nickname: "NikYak", password: "Pollution56")
        return myGolfer
    }
    
}
