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
            

            
            List {
                

                
                NavigationLink(destination: ManageRoundsView(listOfRounds: golfer.getRounds())) {
                    Text("Manage Rounds")
                }
                
                
                
                
                
                
            }
            .toolbar(content: {
                ToolbarItem (placement: .bottomBar) {
                    NavigationLink("Log Out", destination: LoginView())
                        .bold()
                        .foregroundColor(.red)
                }
                ToolbarItem (placement: .primaryAction) {
                    Button(action: {
                        //TODO: Add menu of itemrs
                    }) {
                        Image(systemName: "ellipsis")
                    }
                }
            })
            
            .navigationTitle("Home")
            
        }
        
        
    }
}

struct GolferHomePage_Previews: PreviewProvider {
    static var previews: some View {
        GolferHomePage(golfer: Golfer.sampleGolfer)
    }
}
