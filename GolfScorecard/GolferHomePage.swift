//
//  GolferHomePage.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2022-12-28.
//

import SwiftUI

struct GolferHomePage: View {
    
    let golfer: Golfer
    @State private var isLoggingOut = false
    
    var body: some View {
        NavigationView {
            VStack (alignment: .center) {
                
                Text("Welcome \(golfer.nickname)")
                    .font(.title)
                    .bold()
                    .padding([.top, .leading, .trailing])
                    .multilineTextAlignment(.center)
                
                
                //TODO: add a horizontal line here
                    
                
                
                Text("At a Glance")
                    .font(.title2)
                    .bold()
                    .padding([.leading, .bottom, .trailing])
                    .padding(.top, 1)
                
                HStack {
                    VStack {
                        
                        //TODO: Fix spacing
                        
                        ZStack {
                            
                            if golfer.getNumberOfRounds() != 1 {
                                
                                Text(" \(golfer.getNumberOfRounds()) rounds")
                                    .bold()
                                    .multilineTextAlignment(.center)
                                    .padding()
                            } else {
                                Text(" \(golfer.getNumberOfRounds()) round")
                                    .bold()
                                    .multilineTextAlignment(.center)
                                    .padding()
                                
                            }
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.red)
                                .opacity(0.2)
                                .padding()
                            
                            
                            
                        }
                        
                        
                        
                        ZStack {
                            
                            if golfer.getNumberOfCourses() != 1 {
                                
                                Text(" \(golfer.getNumberOfCourses()) courses")
                                    .bold()
                                    .multilineTextAlignment(.center)
                                    .padding()
                            } else {
                                Text(" \(golfer.getNumberOfCourses()) course")
                                    .bold()
                                    .multilineTextAlignment(.center)
                                    .padding()
                            }
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.orange)
                                .opacity(0.2)
                                .padding()
                            
                            
                        }
                    }
                    
                    ZStack {
                        
                        //TODO: Add a table here for strokes gained in all 4 phases
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.orange)
                            .opacity(0.2)
                            .padding()
                        
                        
                    }
                    
                    
                    
                    
                }
                
                HStack {
                    
                    //TODO: Add section for if the user has no rounds
                    
                    ZStack {
                        
                        VStack {
                            Text("\(golfer.getLowRound())")
                                .bold()
                                .multilineTextAlignment(.center)
                            
                            Text("Low Round")
                                .font(.caption)
                            
                        }
                        .padding()
                        
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.green)
                            .opacity(0.2)
                            .padding()
                    }
                    
                    ZStack {
                        
                        VStack {
                            Text(String(format: "%.2f", golfer.scoringAverage()))
                                .bold()
                                .multilineTextAlignment(.center)
                            
                            Text("Scoring Average")
                                .font(.caption)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            
                        }
                        .padding()
                        
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.green)
                            .opacity(0.2)
                            .padding()
                    }
                    
                    ZStack {
                        
                        VStack {
                            Text(String(format: "%.2f", golfer.getHandicap()))
                                .bold()
                                .multilineTextAlignment(.center)
                            
                            Text("Handicap")
                                .font(.caption)
                                .padding(.horizontal)
                                .multilineTextAlignment(.center)
                            
                        }
                        .padding()
                        
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.green)
                            .opacity(0.2)
                            .padding()
                    }
                    
                    
                    //TODO: add another row of data here...
                }
                
                
                List {
                    
                    NavigationLink(destination: ManageRoundsView(listOfRounds: golfer.getRounds())) {
                        Label("Manage Rounds", systemImage: "figure.golf")
                    }
                    
                    NavigationLink(destination: ReportView(listOfRounds: golfer.getRounds())) {
                        Label("Get Reports", systemImage: "chart.bar")
                    }
                    
                }
                
                
                    
                .toolbar(content: {
                    ToolbarItem (placement: .bottomBar) {
                        NavigationLink("Log Out", destination: LoginView())
                            .bold()
                            .foregroundColor(.red)
                    }
                    ToolbarItem (placement: .primaryAction) {
                        Menu ("More"){
                            //TODO: Fix to make this three dots
                            
                            //change password
                            //etc.
                            
                        }
                    }
                })
            }
            
            
            
            
        }
        
        
    }
}

struct GolferHomePage_Previews: PreviewProvider {
    static var previews: some View {
        GolferHomePage(golfer: Golfer.sampleGolfer)
    }
}
