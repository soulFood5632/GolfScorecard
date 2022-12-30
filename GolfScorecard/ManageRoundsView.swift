//
//  AddRoundView.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2022-12-28.
//

import SwiftUI

struct ManageRoundsView: View {
    var listOfRounds: [Round]
    
    var body: some View {
        NavigationView {
            VStack {
                
                List {
                    
                    NavigationLink(destination: AddRoundSetupView()) {
                        Label("Add Round", systemImage: "plus.circle.fill")
                            .font(.headline)
                            .padding(10)
                    }
                
                    
                    
                    NavigationLink(destination: ListEditView()) {
                        Label("Edit/Delete Rounds", systemImage: "pencil")
                            .font(.headline)
                            .padding(10)
                    }
                    
                    
                }
                .navigationTitle("Manage Rounds")
                
                
                VStack {
                    if(listOfRounds.isEmpty){
                        Text("You have no rounds")
                    }
                    
                }
            }
                
                
        
            
        }
    }
        
}

struct ManageRound_Previews: PreviewProvider {
    static var previews: some View {
        ManageRoundsView(listOfRounds: [Round]())
    }
}
