//
//  TeeData+CoreDataClass.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2023-01-03.
//
//

import Foundation
import CoreData

@objc(TeeData)
public class TeeData: NSManagedObject {
    
    init(slope: Int, rating: Float) {
        self.slope = slope
        self.rating = rating
        self.holeData = [HoleInfo]()
    }
    
    public func updateHoleData(holeByHoleData: [HoleInfo]) {
        holeData!.append(contentsOf: holeByHoleData)
    }
    
    public func updateHoleData(holeData: HoleInfo) {
        self.holeData!.append(holeData)
    }
    
    
    
    

}
