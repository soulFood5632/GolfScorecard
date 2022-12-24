//
//  HoleInfo.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2022-12-16.
//

import Foundation

public class HoleInfo{
    
    /**
     A basic hole. A 400 yard par 4.
     */
    public static let basicHole = HoleInfo(par: 4, yardage: 400)
    
    
    
    private var par: Int
    private var yardage: Int
    
    init(par: Int, yardage: Int) {
        self.par = par
        self.yardage = yardage
    }
    
    /**
     Updates the par of the hole
     */
    
    public func updatePar(newPar: Int) {
        par = newPar
    }
    
    /**
     Updates the yardage of the hole
     */
    public func updateYardage(newYardage: Int) {
        yardage = newYardage
    }
    
    /**
     Gets the par of the Hole
     */
    
    public func getPar() -> Int {
        return par
    }
    
    /**
     Gets the yardage of the hole
     */
    public func getYardage() -> Int {
        return yardage
    }
    
    /**
     Gets the information of the hole in a tuple of the format (Par, Yardage)
     */
    public func getHoleInfo() -> (Int, Int) {
        return (par, yardage)
    }
    
    
    /**
     Gets the start position of this hole
     */
    public func getStartPosition() -> Position {
        return Position(distance: yardage, lieType: Lie.tee)
    }
    

    
}
