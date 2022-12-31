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
        self.isLocked = false
        
        
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
        
        self.isLocked = false
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
     Adds the shots to the desired hole via a list of poisitions
     */
    public func addShotsToHole(listOfPositions: [Position], holeNum: Int) throws {
        if let _ = holeList[holeNum] {
            holeList[holeNum]?.postionalBasedShotEntry(positionList: listOfPositions)
        } else {
            throw RetreivalError.NoHoleExists
        }
        
    }
    
    
    
    
    /**
     Finds the score of the player over the total round
     */
    public func getScore() -> Int {
        if isLocked {
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
        if isLocked {
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
        for (_, holeEntry) in holeList {
            totalPar += holeEntry.getPar()
        }
        return totalPar
    }
    
    /**
     Gets the score of this round to par
     */
    
    public func getScoreToPar() -> Int {
        return getScore() - getPar()
    }
    
    public func getTotalYardage() -> Int {
        return holeList.map { $0.value.getYardage()}.reduce(0) { $0 + $1 }
    }
    
    
    
    
    /**
     Calculates the score of the round given the current state.
     */
    private func calculateScore() -> Int {
//        var totalScore = 0
        return holeList.map{$0.value.getScore()}.reduce(0) { $0 + $1 }
        //TODO: check to make sure that works
//        for (_, holeEntry) in holeList {
//            totalScore += holeEntry.getScore()
//        }
//        return totalScore
    }
    
    /**
     Gets a list of all the shots from the specified hole.
     Throws HoleNotFound exception of no hole exsits
     */
    public func getShotsFromHole(holeNum: Int) throws -> [Shot] {
        if let listOfShots = holeList[holeNum]?.getShots() {
            return listOfShots
        }
        throw RetreivalError.NoHoleExists
    }
    
    
    /**
     Gets a list of all shots from the round
     */
    public func getAllShots() -> [Shot] {
        var totalListofShots = [Shot]()
        for (_, holeEntry) in holeList {
            for shot in holeEntry.getShots() {
                totalListofShots.append(shot)
            }
        }
        
        return totalListofShots
    }
    
    public func lockRound() {
        isLocked = true
    }
    
    public func unlockRound() {
        cachedScore = nil
        cachedShots = nil
        isLocked = false
    }
    
    public func getDifferential() -> Double {
        return (113 / Double(self.slope)) * Double(Float(getScore()) - self.rating)
    }
    
    
    
    /**
     Counts the number of a parituclar score in this round
     */
    public func countNumberOf(scoreType: NamesOfScores) -> Int {
        let scoreToLookFor: Int
        switch scoreType {
        case .Double:
            scoreToLookFor = 2
        case .TripleOrWorse:
            return holeList.map{ $0.value.getScoreToPar() }.filter{ (number: Int) -> Bool in number >= 3}.count
        case .Bogey:
            scoreToLookFor = 1
        case .Par:
            scoreToLookFor = 0
        case .Birdie:
            scoreToLookFor = -1
        case .EagleOrBetter:
            return holeList.map{ $0.value.getScoreToPar() }.filter{ (number: Int) -> Bool in number <= -2}.count
        }
        
        return holeList.map{ $0.value.getScoreToPar() }.filter{ (number: Int) -> Bool in number == scoreToLookFor}.count
        
    }
    
    
     // TODO: More on reports below

    
    
    
}

extension Round {
    static var exampleRound: Round {
        do {
            let myRound = try Round(course: Course.sampleCourseInfo, teeName: Course.sampleCourseInfo.getTeeNames()[0])
            
            let listOfPositions = [Position(distance: 243, lieType: Lie.tee), Position(distance: 123, lieType: Lie.bunker), Position(distance: 6, lieType: Lie.green), Position(distance: 1, lieType: Lie.green)]
            
            for i in 1...18 {
                try myRound.addShotsToHole(listOfPositions: listOfPositions, holeNum: i)
            }
            
            return myRound
        } catch {
            fatalError("error in round extension")
        }
        
        
    }
}



