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
    
    
    /**
     Initilizer with a list of shots already included. This list must be ordered from first shot to last shot.
     */

    init(shots: [Shot], holeInfo: HoleInfo) {
        self.holeInfo = holeInfo
        self.shots = shots
    
    }
    
    /**
     Adds a shot to the end of the list
     
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
     Adds a shot at the specified shotNumber. All other shots below will be bumped down
     */
    public func addShot(shotNum: Int, shotToAdd: Shot) {
        shots.insert(shotToAdd, at: shotNum)
    }
    
    /**
     * Gets the score of the user for that hole
     * 
     * Effects: Returns an integer totalling the score of the player on this hole
     */
    public func getScore() -> Int {
        return shots.count
    }
    
    /**
     Gets the expected score of this hole
     */
    public func getExpectedScore() -> Double {
        return holeInfo.getStartPosition().getExpectedShots()
    }
    
    /**
     Gets a list of the shots on this hole. 
     */
    public func getShots() -> [Shot] {
        return shots
    }
    
    
    
}

