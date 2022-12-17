//
//  Round.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2022-12-15.
//

import Foundation

struct Round {
    
    private var datePlayed: Date
    private var scorecard: Scorecard!
    private var courseInfo: CouseInfo!
    
    init(datePlayed: Date, courseInfo: CouseInfo, scorecard : Scorecard){
        self.datePlayed = datePlayed
        self.scorecard = scorecard
        self.courseInfo = courseInfo
    }
    
    init(datePlayed: Date, courseInfo: CouseInfo){
        self.datePlayed = datePlayed
        self.courseInfo = courseInfo
    }
    
    
    
}
