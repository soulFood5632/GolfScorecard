//
//  Golfer.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2022-12-16.
//

import Foundation

class Golfer{
    private var userID: String
    private var handicap : Double
    
    private let DEFAULT_HANDICAP: Double = 36.0
    
    init(name: String) {
        self.userID = name
        self.handicap = DEFAULT_HANDICAP
    }
    
    
    
}
