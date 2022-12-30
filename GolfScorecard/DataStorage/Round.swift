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
    
    public func getDate() -> Date {
        return datePlayed
    }
    
    
     // TODO: More on reports below

    
    
    
}

extension Round {
    static var exampleRound: Round {
        var round2: Round
        do {
            round2 = Round(courseData: try CourseInfo.sampleCourseInfo.getTeeData(name: "Black"))
        } catch {
            fatalError("Busted tee Collection in extension Round")
        }
        var myCard = round2.getScorecard()
        var holesList = myCard.getAllHoles()
        
        
        
        for (_, hole) in holesList {
            
            var journey = [Position]()
            
            journey.append(hole.getHoleInfo().getStartPosition())
            journey.append(Position(distance: 210, lieType: Lie.recovery))
            journey.append(Position(distance: 123, lieType: Lie.bunker))
            journey.append(Position(distance: 4, lieType: Lie.green))
            
            hole.postionalBasedShotEntry(positionList: journey)
        
            
        }
        
        myCard.lockRound()
        
        round2.updateScorecard(newCard: myCard)
        
        return round2
    }
}
