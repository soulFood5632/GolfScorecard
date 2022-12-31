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
                    .padding()
                    .multilineTextAlignment(.center)
                    
                
                
                
                
                
                List {
                    
                    NavigationLink(destination: ManageRoundsView(listOfRounds: golfer.getRounds())) {
                        Label("Manage Rounds", systemImage: "figure.golf")
                    }
                    
                    
                    
                    
                    
                    
                }
                
                Text("At a Glance")
                    .font(.title2)
                    .bold()
                    .padding()
                
                HStack {
                    
                    ZStack {
                        
                        Text("You've posted \(golfer.getNumberOfRounds()) rounds")
                            .bold()
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.red)
                            .opacity(0.2)
                            .padding()
                            
                            
                            
                    }
                    
                    ZStack {
                        
                        Text("You've posted \(golfer.getNumberOfRounds()) rounds")
                            .bold()
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.green)
                            .opacity(0.2)
                            .padding()
                            
                            
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
