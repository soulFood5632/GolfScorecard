//
//  GolferList.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2022-12-24.
//

import Foundation

class GolferList {
    /**
     Golfer list from their username to password
     */
    private var passwordList:[String: String]
    
    /**
     Golfer list from userID to golfer object
     */
    private var golferList: [String: Golfer]
    
    private var golfers: Set<String>
    
    init(){
        passwordList = [String: String]()
        golferList = [String: Golfer]()
        golfers = Set<String>()
    }
    
    public func addGolfer(userID: String, password: String) -> Bool{
        return true
    }
}
