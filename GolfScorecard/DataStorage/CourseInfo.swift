//
//  CourseInfo.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2022-12-16.
//

import Foundation

public class CourseInfo{
    
    private var teeInfo: [String: (Int, Float, [HoleInfo])]
    
    init() {
        self.teeInfo = [String: (Int, Float, [HoleInfo])]()
    }
    
    /**
     Adds a tee to the course. Returns false if the tee of the same name already exists,
     true otherwise. In the both cases the data is updated
     */
    public func addTee(name: String, slope: Int, rating: Float) -> Bool{
        if(teeInfo[name] != nil){
            teeInfo[name] = (slope, rating, [HoleInfo]())
            return true
        }
        teeInfo[name] = (slope, rating, [HoleInfo]())
        return false
    }
    
    /**
     Gets the tee data.
     Returns the a tuple of the form (Slope, Rating, [HoleInfo]).
     Throws a NoTeeExists error if the tee requested does not exist
     */
    public func getTeeData(name: String) throws -> (Int, Float, [HoleInfo]) {
        guard let teeData = teeInfo[name] else {
            throw RetreivalError.NoTeeExists
        }
    
        return teeData
        
    }
    
    /**
     Gets the data for the whole indicated by holeNum and the tee titled String.
     
     Requires: Hole number and teename must be valid (Tee must exist and holeNumber must be within the size of the course)
     */
    public func getHoleData(name: String, holeNum : Int) throws -> HoleInfo {
        
        guard let holeYardages = teeInfo[name]?.2 else {
            throw RetreivalError.NoTeeExists
        }
        if holeNum > holeYardages.count {
            throw RetreivalError.NoHoleExists
        }
        return holeYardages[holeNum - 1]
        

    }
    
    /**
     Gets the list of tee names for this course
     */
    public func getTeeNames() -> [String] {
        return teeInfo.map{teeName, information in teeName}
    }
    
    /**
     Appends the teeInfo with a list of HoleInfo.
     
     Requires: teeName must exist
     */
    public func addHoleInfo(teeName: String, info: [HoleInfo]) throws {
        if !doesTeeExist(teeName: teeName) {
            throw RetreivalError.NoTeeExists
        }
        teeInfo[teeName]?.2.append(contentsOf: info)
    }
    
    /**
     Appends the teeInfo with a single entry of HoleInfo.
     
     Requires: teeName must exist
     */
    
    public func addHoleInfo(teeName: String, info: HoleInfo) throws {
        if !doesTeeExist(teeName: teeName) {
            throw RetreivalError.NoTeeExists
        }
        teeInfo[teeName]?.2.append(info)
    }
    
    /**
     Helper method to add a bulk set of yardages. The tee names key corresponds to the order of the yardages
     of the list in the tuple. Each teename must exist or a retreival error will be thrown. 
     */
    
    public func bulkHoleInfoAdd(teeNamesKey: [String], holeData: [(Int, [Int])]) throws {
        for teeName in teeNamesKey {
            if !doesTeeExist(teeName: teeName) {
                throw RetreivalError.NoTeeExists
            }
        }
        
        for multiTeeIndividualHoleData in holeData {
            var index = 0;
            for individualTeeHoleData in multiTeeIndividualHoleData.1 {
                let newHoleData = HoleInfo(par: multiTeeIndividualHoleData.0, yardage: individualTeeHoleData)
                do {
                    try addHoleInfo(teeName: teeNamesKey[index], info: newHoleData)
                } catch RetreivalError.NoTeeExists {
                    fatalError("Illegal Input of teeKey")
                }
                index += 1
            }
        }
    }
    
    /**
     Checks if the tee of that name exists. Returns true if it does, false otherwise.
     */
    public func doesTeeExist(teeName: String) -> Bool {
        return getTeeNames().contains(teeName)
    }
    
    
    
    
    
    
}


