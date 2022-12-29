//
//  GolferHomePage.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2022-12-28.
//

import SwiftUI

struct GolferHomePage: View {
    
    let golfer: Golfer
    
    var body: some View {
        NavigationView {
            List {
                
                NavigationLink(destination: ManageRoundsView()) {
                    Text("Manage Rounds")
                        .font(.title3)
                }
                
                
                
                
                
            }
            
        }
        .navigationTitle("Home")
        
    }
}

struct GolferHomePage_Previews: PreviewProvider {
    static var previews: some View {
        GolferHomePage(golfer: Golfer.sampleGolfer)
    }
}
