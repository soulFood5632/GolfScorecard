//
//  CourseInfoTests.swift
//  GolfScorecardTests
//
//  Created by Logan Underwood on 2022-12-17.
//

import Foundation

import XCTest
@testable import GolfScorecard

final class CourseInfoTests: XCTestCase {


    func testMakeCourse() throws {
        var hole1 = HoleInfo(par: 4, yardage: 450)
        
        XCTAssertTrue(hole1.getPar() == 4)
        XCTAssertTrue(hole1.getYardage() == 450)
        
        var myPar = hole1.getPar()
        
        myPar = 10
        
        XCTAssertEqual(4, hole1.getPar())
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
