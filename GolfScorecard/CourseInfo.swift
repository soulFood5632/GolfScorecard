//
//  CourseInfo.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2022-12-16.
//

import Foundation

public class CouseInfo{
    
    private var teeInfo = [String: (Int, Float, [HoleInfo])]()
    private var name: String
    
    init(name: String){
        self.name = name
    }
    
    /**
     Updates the name of the course. Returns true if the the name was succsefully changed
     */
    public func updateCourseName(name: String) -> Bool{
        self.name = name
        return true
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
        if holeNum >= holeYardages.count {
            throw RetreivalError.NoHoleExists
        }
        return holeYardages[holeNum]
        

    }
    
    /**
     Gets the list of tee names for this course
     */
    public func getTeeNames() -> [String] {
        return [String]()
    }
    
    
}

/**
 Error for incorrect tee name calls
 */

public enum RetreivalError: Error{
    case NoTeeExists
    case NoHoleExists
}
