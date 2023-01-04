//
//  HoleInfo+CoreDataClass.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2023-01-03.
//
//

import Foundation
import CoreData

@objc(HoleInfo)
public class HoleInfo: NSManagedObject {
    
    /**
     A basic hole. A 400 yard par 4.
     */
//    public static let basicHole = HoleInfo(par: 4, yardage: 400)
    
    
//    private var par: Int
//    private var yardage: Int
        
    init(par: Int64, yardage: Int64, entity: NSEntityDescription, context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
        self.par = par
        self.yardage = yardage
    }
    
    
    /**
     Updates the par of the hole
     */
    
    public func updatePar(newPar: Int64) {
        par = newPar
    }
    
    /**
     Updates the yardage of the hole
     */
    public func updateYardage(newYardage: Int64) {
        yardage = newYardage
    }
    
    /**
     Gets the par of the Hole
     */
    
    public func getPar() -> Int64 {
        return par
    }
    
    /**
     Gets the yardage of the hole
     */
    public func getYardage() -> Int64 {
        return yardage
    }
    
    /**
     Gets the information of the hole in a tuple of the format (Par, Yardage)
     */
    public func getHoleInfo() -> (Int64, Int64) {
        return (par, yardage)
    }
    
    
    /**
     Gets the start position of this hole
     */
    public func getStartPosition() -> Position {
        return Position(distance: Int(yardage), lieType: Lie.tee)
    }
    
    /**
     Equals method for this dataType
     */
    public static func == (lhs: HoleInfo, rhs: HoleInfo) -> Bool {
        return lhs.getHoleInfo().0 == rhs.getHoleInfo().0 && lhs.getHoleInfo().1 == rhs.getHoleInfo().1
    }
}
