//
//  RegressionModel.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2022-12-17.
//

import Foundation
import CreateML

class RegressionModel {
    
    private let regressionFit = [Lie: [Double]]()
    
    
    
    /**
     Gets the expected value of this position
     */
    public func expectedVal(pos: Position) -> Double {
        guard let constants = regressionFit[pos.getLie()] else {
            fatalError("Lie does not exist in model")
        }
        
    
    }
    
    
    
    
}
