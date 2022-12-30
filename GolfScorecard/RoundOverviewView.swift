//
//  RoundOverviewView.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2022-12-29.
//

import SwiftUI

struct RoundOverviewView: View {
    
    let myRound: Round
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("\(myRound.getScorecard().getScore())")
                        .font(.system(size: 60, weight: .bold))
                    
                         
                    Text("Score")
                    
                }
                .padding()
                VStack {
                    var scoreToPar = myRound.getScorecard().getScoreToPar()
                    if scoreToPar == 0 {
                        Text("(-)")
                            .bold()
                            .foregroundColor(.green)
                            .font(.system(size: 35))
                    } else if scoreToPar < 0 {
                        Text("(\(scoreToPar))")
                            .bold()
                            .foregroundColor(.red)
                            .font(.system(size: 35))
                        
                    } else if scoreToPar > 0 {
                        Text("(\(scoreToPar))")
                            .bold()
                            .foregroundColor(.black)
                            .font(.system(size: 35))
                    }
                    
                    Text("To Par")
                    
                }
                .padding()
                
                VStack {
                    var differential = Double(myRound.getScorecard().getDifferential())
                    if differential == 0 {
                        Text(String(format: "%.1f", differential))
                            .bold()
                            .foregroundColor(.green)
                            .font(.system(size: 35))
                    } else if differential < 0 {
                        Text(String(format: "%.1f", differential))
                            .bold()
                            .foregroundColor(.red)
                            .font(.system(size: 35))
                        
                    } else if differential > 0 {
                        Text(String(format: "%.1f", differential))
                            .bold()
                            .foregroundColor(.black)
                            .font(.system(size: 35))
                    }
                    
                    Text("Differential")
                }
                .padding()
                
            }
        
        }
    }
}

struct RoundOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        RoundOverviewView(myRound: Round.exampleRound)
    }
}
