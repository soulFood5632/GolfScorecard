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
                
                
                Divider()
                    
                
                
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
                        
                        if golfer.getRounds().isEmpty {
                            
                            Text("Post a round for juicy stats 😏😏")
                                .bold()
                                .multilineTextAlignment(.center)
                                .padding()
                            
                            
                            
                        } else {
                            
                            Text("Strokes gained Table TBA")
                            
                            //TODO: Add a table here for strokes gained in all 4 phases
                            
                            
                        }
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.mint)
                            .opacity(0.2)
                            .padding()
                        
                        
                    }
                    
                    
                    
                    
                }
                
                HStack {
                    
                    if golfer.getRounds().isEmpty {
                        ZStack {
                            
                            VStack {
                                Text("Get started by posting a round through the manage rounds tab")
                                    .bold()
                                    .multilineTextAlignment(.center)
                                    .font(.title3)
                                    .padding()
                                
                            }
                            .padding()
                            
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.green)
                                .opacity(0.2)
                                .padding()
                        }
                        
                    } else {
                        
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
                                Text(String(format: "%.1f", golfer.scoringAverage()))
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
                                Text(String(format: "%.1f", golfer.getHandicap()))
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
                    }
                    
                    
                    
                }
                
                HStack {
                    ZStack {
                        VStack {
                            let numOfParBreakers = golfer.getLastRound().countNumberOf(scoreType: NamesOfScores.Birdie) + golfer.getLastRound().countNumberOf(scoreType: NamesOfScores.EagleOrBetter)
                            if numOfParBreakers > 2 {
                                Text("🔥🔥")
                                    .font(.title)
                                
                            } else {
                                Text("🧊🧊")
                                    .font(.title)
                            }
                            
                            if numOfParBreakers == 1 {
                                Text("\(numOfParBreakers) Par Breaker Last Round")
                                    .multilineTextAlignment(.center)
                                    .bold()
                            } else if numOfParBreakers == 0 {
                                Text("Birdie Free Last Round")
                                    .multilineTextAlignment(.center)
                                    .bold()
                            }
                            Text("\(numOfParBreakers) Par Breakers Last Round")
                                .multilineTextAlignment(.center)
                                .bold()
                                
                            
                        }
                        .padding()
                        
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.yellow)
                            .opacity(0.2)
                            .padding()
                    }
                    
                    ZStack {
                        VStack {
                            let numOfBogeys = golfer.getLastRound().countNumberOf(scoreType: NamesOfScores.Bogey)
                            if numOfBogeys > 2 {
                                Text("🧊🧊")
                                    .font(.title)
                            } else {
                                Text("🔥🔥")
                                    .font(.title)
                            }
                            if numOfBogeys == 0 {
                                Text("Bogey Free Last Round")
                                    .multilineTextAlignment(.center)
                                    .bold()
                            } else if numOfBogeys == 1 {
                                Text("\(numOfBogeys) Bogey Last Round")
                                    .multilineTextAlignment(.center)
                                    .bold()
                            } else {
                                
                                Text("\(numOfBogeys) Bogeys Last Round")
                                    .multilineTextAlignment(.center)
                                    .bold()
                            }
                                
                            
                        }
                        .padding()
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.yellow)
                            .opacity(0.2)
                            .padding()
                    }
                    
                    
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
                        Menu {
                            NavigationLink (destination: ManageAccountView(golfer: golfer)) {
                                Text("Manage Account")
                            }

                            
                        } label: {
                            Image(systemName: "ellipsis")
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
