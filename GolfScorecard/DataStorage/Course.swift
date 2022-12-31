//
//  CourseInfo.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2022-12-16.
//

import Foundation

public class Course : Hashable{
    
    private var teeInfo: [String: (Int, Float, [HoleInfo])]
    public let name: String
    public let city: String
    public let state_province: String
    public let country: String
    public let courseID: UUID
    
    
    /**
     Init for this course, **Note** the triplet must be entered in the form (City, State, Country)
     */
    init(name: String, city_State_Country: (String, String, String)) {
        self.teeInfo = [String: (Int, Float, [HoleInfo])]()
        self.name = name
        self.city = city_State_Country.0
        self.state_province = city_State_Country.1
        self.country = city_State_Country.2
        
        self.courseID = UUID()
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
    
    /**
     Equals method for the course datatype
     */
    public static func == (lhs: Course, rhs: Course) -> Bool {
        return lhs.courseID == rhs.courseID
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(courseID)
    }
    
    
}

extension Course {
    
    
    
    static var sampleCourseInfo: Course {
        var makaiCourseInfo = Course(name: "Makai Golf Course", city_State_Country: ("Princeville", "HI", "USA"))
        
        makaiCourseInfo.addTee(name: "Black", slope: 134, rating: 75.4)
        makaiCourseInfo.addTee(name: "Blue", slope: 127, rating: 71.4)
        makaiCourseInfo.addTee(name: "White", slope: 125, rating: 69.6)
        
        var teeData = [(Int, [Int])]()
        
        var holeData = [Int]()
        
        //Hole 1
        
        holeData.append(464)
        holeData.append(427)
        holeData.append(397)
        
        teeData.append((4, holeData))
        
        //Hole 2
        
        holeData = [Int]()
        
        holeData.append(611)
        holeData.append(570)
        holeData.append(549)
        
        teeData.append((5, holeData))
        
        //Hole 3
        
        holeData = [Int]()
        
        holeData.append(181)
        holeData.append(153)
        holeData.append(150)
        
        teeData.append((3, holeData))
        
        //Hole 4
        
        holeData = [Int]()
        
        holeData.append(385)
        holeData.append(334)
        holeData.append(312)
        
        teeData.append((4, holeData))
        
        //Hole 5
        
        holeData = [Int]()
        
        holeData.append(540)
        holeData.append(500)
        holeData.append(479)
        
        teeData.append((5, holeData))
        
        //Hole 6
        
        holeData = [Int]()
        
        holeData.append(446)
        holeData.append(409)
        holeData.append(395)
        
        teeData.append((4, holeData))
        
        //Hole 7
        
        holeData = [Int]()
        
        holeData.append(213)
        holeData.append(173)
        holeData.append(155)
        
        teeData.append((3, holeData))
        
        //Hole 8
        
        holeData = [Int]()
        
        holeData.append(359)
        holeData.append(294)
        holeData.append(278)
        
        teeData.append((4, holeData))
        
        //Hole 9
        
        holeData = [Int]()
        
        holeData.append(403)
        holeData.append(368)
        holeData.append(346)
        
        teeData.append((4, holeData))
        
        //Hole 10
        
        holeData = [Int]()
        
        holeData.append(399)
        holeData.append(363)
        holeData.append(346)
        
        teeData.append((4, holeData))
        
        //Hole 11
        
        holeData = [Int]()
        
        holeData.append(520)
        holeData.append(479)
        holeData.append(462)
        
        teeData.append((4, holeData))
        
        //Hole 12
        
        holeData = [Int]()
        
        holeData.append(450)
        holeData.append(440)
        holeData.append(420)
        
        teeData.append((4, holeData))
        
        //Hole 13
        
        holeData = [Int]()
        
        holeData.append(255)
        holeData.append(198)
        holeData.append(175)
        
        teeData.append((3, holeData))
        
        //Hole 14
        
        holeData = [Int]()
        
        holeData.append(338)
        holeData.append(292)
        holeData.append(288)
        
        teeData.append((4, holeData))
        
        //Hole 15
        
        holeData = [Int]()
        
        holeData.append(414)
        holeData.append(355)
        holeData.append(342)
        
        teeData.append((4, holeData))
        
        //Hole 16
        
        holeData = [Int]()
        
        holeData.append(202)
        holeData.append(197)
        holeData.append(171)
        
        teeData.append((4, holeData))
        
        //Hole 17
        
        holeData = [Int]()
        
        holeData.append(476)
        holeData.append(410)
        holeData.append(370)
        
        teeData.append((4, holeData))
        
        //Hole 18
        
        holeData = [Int]()
        
        holeData.append(567)
        holeData.append(534)
        holeData.append(505)
        
        teeData.append((5, holeData))
        
        
        let teekey = ["Black", "Blue", "White"]
        do {
            try makaiCourseInfo.bulkHoleInfoAdd(teeNamesKey: teekey, holeData: teeData)
        } catch {
            fatalError("tee names checking error ")
        }
        
        return makaiCourseInfo
    }
}


