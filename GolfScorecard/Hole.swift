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
    
    init(holeInfo: HoleInfo){
        self.shots = [Shot]()
        self.holeInfo = holeInfo
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
     Adds a shot at the specified shotNumber. All other shots below will be bumped down.
     If the shot number is greater than the current number of shots, then it will added
     to the end
     */
    public func addShot(shotNum: Int, shotToAdd: Shot) {
        if shotNum >= shots.count {
            shots.append(shotToAdd)
        } else {
            shots.insert(shotToAdd, at: shotNum)
        }
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
    
    
    /**
     Gets the hole information.
     */
    public func getHoleInfo() -> HoleInfo {
        return holeInfo
    }
    
    /**
     A streamlined data entry method containing all the positions from the hole.
     e.g -> the first element in the list is the first position, the second element
     is the second positon... the Nth entry is the Nth position. **NOTE** do not include
     the holed position
     */
    public func postionalBasedShotEntry(positionList: [Position]) {
        for index in 0...positionList.count - 1 {
            if index + 1 == positionList.count {
                addShot(shotToAdd: Shot(startPos: positionList[index], endPos: Position.holedOut()))
                return
            }
            addShot(shotToAdd: Shot(startPos: positionList[index], endPos: positionList[index + 1]))
            
        }
    }
    
    
    
    
    
}

