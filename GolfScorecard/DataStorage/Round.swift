//
//  Round.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2022-12-15.
//

import Foundation

class Round {
    
    private var datePlayed: Date
    private var slope: Int
    private var rating: Float
    private var holeList: [Int: Hole]
    private var isLocked: Bool
    private var course: Course
    private var teeName: String
    
    private let roundID: UUID
    
    private var cachedScore: Int?
    private var cachedShots: [Shot]?
    private var cachedPar: Int?
    
    /**
     A round with an explcit date. Throws tee does not exist
     */
    init(datePlayed: Date, course: Course, teeName: String) throws {
        self.roundID = UUID()
        self.datePlayed = datePlayed
        self.course = course
        self.teeName = teeName
        if !course.doesTeeExist(teeName: teeName) {
            throw RetreivalError.NoTeeExists
        }
        try self.slope = course.getTeeData(name: teeName).0
        try self.rating = course.getTeeData(name: teeName).1
        let holeData = try course.getTeeData(name: teeName).2
        
        self.holeList = [Int: Hole]()
        
        var holeNum =  1
        
        for holeInfo in holeData {
            self.holeList[holeNum] = Hole(holeInfo: holeInfo)
            holeNum += 1
        }
        
        
        
        
        
        
        
    }
    
    public func getRoundID() -> UUID {
        return roundID
    }
    
    /**
     A round with an implcit date, set to the current date
     */
    init(course: Course, teeName: String) throws {
        self.roundID = UUID()
        self.course = course
        self.teeName = teeName
        if !course.doesTeeExist(teeName: teeName) {
            throw RetreivalError.NoTeeExists
        }
        try self.slope = course.getTeeData(name: teeName).0
        try self.rating = course.getTeeData(name: teeName).1
        let holeData = try course.getTeeData(name: teeName).2
        
        self.holeList = [Int: Hole]()
        
        var holeNum =  1
        
        for holeInfo in holeData {
            self.holeList[holeNum] = Hole(holeInfo: holeInfo)
            holeNum += 1
        }
        
        self.datePlayed = Date.now
    }
    
    
    public func getCourseName() -> String {
        return course.name
    }
    
    public func getAddress() -> (String, String, String) {
        return (course.city, course.state_province, course.country)
    }
    
    
    
    
    /**
     Updates the date of the round
     */
    public func changeDate(newDate: Date) {
        self.datePlayed = newDate
    }
    
    
    
    public func getDate() -> Date {
        return datePlayed
    }
    
    
    /**
     Gets information on this hole.
     */
    public func getHole(holeNum: Int) throws -> Hole {
        
        if let hole = holeList[holeNum] {
            return hole
        }
        throw RetreivalError.NoHoleExists
        
    }
    
    /**
     Gets the set of holes in list format
     */
    public func getAllHoles() -> [Int: Hole] {
        return holeList
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
    
    
     // TODO: More on reports below

    
    
    
}


