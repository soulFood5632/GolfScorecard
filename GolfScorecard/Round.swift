//
//  Round.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2022-12-15.
//

import Foundation

class Round {
    
    private var datePlayed: Date
    private var scorecard: Scorecard!
    
    /**
     A round with an explcit date
     */
    init(datePlayed: Date, courseData: (Int, Float, [HoleInfo])){
        self.datePlayed = datePlayed
        self.scorecard = Scorecard(courseTemplate: courseData)
    }
    
    /**
     A round with an implcit date, set to the current date
     */
    init(courseData: (Int, Float, [HoleInfo])){
        self.datePlayed = Date.now
        self.scorecard = Scorecard(courseTemplate: courseData)
    }
    
    
    /**
     Gets the scorecard for the current round
     */
    public func getScorecard() -> Scorecard {
        return scorecard
    }
    
    
    /**
     Updates the date of the round
     */
    public func changeDate(newDate: Date) {
        self.datePlayed = newDate
    }
    
    /**
     Updates the scorecard of this round to the new scorecard
     */
    public func updateScorecard(newCard: Scorecard) {
        self.scorecard = newCard
    }
    
    
     // TODO: More on reports below

    
    
    
}
