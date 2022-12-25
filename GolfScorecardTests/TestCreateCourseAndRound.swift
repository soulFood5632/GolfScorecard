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
    private var seymourCourseInfo = CourseInfo()



    func testIllegalRequests() throws {
        XCTAssertFalse(myDatabase.isCourse(name: "Seymour Golf and Country Club"))
        XCTAssertFalse(seymourCourseInfo.doesTeeExist(teeName: "Black"))
        
        
        
        
        
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

