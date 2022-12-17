//
//  Hole.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2022-12-15.
//

import Foundation

class Hole {
    
    private var shots: [Shot]
    private let holeInfo: HoleInfo

    init(shots: [Shot], holeInfo: HoleInfo) {
        self.shots = shots
        self.holeInfo = holeInfo
    }
    
    /**
     Adds a shot the end of the list
     
     <\l>
     Requires: Shot != nil
     */
    
    public func addShot(shotToAdd : Shot) {
        shots.append(shotToAdd)
    }
    
    /**
     Adds a list of shots the end of the list
     
     <\l>
     Requires: All shots != nil
     */
    
    public func addShots(shotsToAdd : [Shot]) {
        for shotToAdd in shotsToAdd {
            shots.append(shotToAdd)
        }
    }
    
    /**
     * Gets the score of the user for that hole
     * 
     * Effects: Returns an integer totalling the score of the player on this hole
     */
    public func getScore() -> Int{
        return shots.count
    }
    
    
}

