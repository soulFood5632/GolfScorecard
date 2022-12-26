//
//  TestCreateCourseAndRound.swift
//  GolfScorecardTests
//
//  Created by Logan Underwood on 2022-12-23.
//

import Foundation

import XCTest
@testable import GolfScorecard

final class TestCreateCourseAndRound: XCTestCase {
    
    private let myDatabase = CourseDatabase()
    private var makaiCourseInfo = CourseInfo()
    
    private var myGolfer: Golfer!



    func testIllegalRequests() throws {
        XCTAssertFalse(myDatabase.isCourse(name: "Makai Golf Club"))
        XCTAssertFalse(makaiCourseInfo.doesTeeExist(teeName: "Black"))
    }
    
    func testAddCourse() throws {
        
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
        
        
        
        myDatabase.addCourse(name: "Makai Golf Club", courseData: makaiCourseInfo)
        
        XCTAssertTrue(myDatabase.isCourse(name: "Makai Golf Club"))
        XCTAssertTrue(makaiCourseInfo.doesTeeExist(teeName: "Black"))
        XCTAssertTrue(makaiCourseInfo.doesTeeExist(teeName: "Blue"))
        var testHoleInfo = try myDatabase.getCourse(name: "Makai Golf Club").getHoleData(name: "Blue", holeNum: 18)
        XCTAssertEqual(HoleInfo(par: 5, yardage: 534), try myDatabase.getCourse(name: "Makai Golf Club").getHoleData(name: "Blue", holeNum: 18))
        XCTAssertEqual(HoleInfo(par: 3, yardage: 155), try myDatabase.getCourse(name: "Makai Golf Club").getHoleData(name: "White", holeNum: 7))
        XCTAssertEqual(HoleInfo(par: 4, yardage: 476), try myDatabase.getCourse(name: "Makai Golf Club").getHoleData(name: "Black", holeNum: 17))
        
    }
    
    func testMakeGolfer() throws {
        myGolfer = Golfer(name: "Logan")
    }
    
    
    
    func testModifyHole() throws {
        var hole1 = HoleInfo(par: 4, yardage: 450)
        
        hole1.updateYardage(newYardage: 400)
        
        XCTAssertEqual(400, hole1.getYardage())
        
        hole1.updatePar(newPar: 5)
        
        XCTAssertEqual(5, hole1.getPar())
        
        XCTAssertEqual(400 , hole1.getHoleInfo().1)
        
        XCTAssertEqual(5, hole1.getHoleInfo().0)
        
        var myInfo = hole1.getHoleInfo()
        
        myInfo = (3, 175)
        
        XCTAssertEqual(400 , hole1.getHoleInfo().1)
        
        XCTAssertEqual(5, hole1.getHoleInfo().0)
    }

}

