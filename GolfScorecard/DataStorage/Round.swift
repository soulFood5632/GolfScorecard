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
    private let roundID: UUID
    
    /**
     A round with an explcit date
     */
    init(datePlayed: Date, courseData: (Int, Float, [HoleInfo])){
        self.roundID = UUID()
        self.datePlayed = datePlayed
        self.scorecard = Scorecard(courseTemplate: courseData)
    }
    
    public func getRoundID() -> UUID {
        return roundID
    }
    
    /**
     A round with an implcit date, set to the current date
     */
    init(courseData: (Int, Float, [HoleInfo])){
        self.datePlayed = Date.now
        self.scorecard = Scorecard(courseTemplate: courseData)
        self.roundID = UUID()
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
