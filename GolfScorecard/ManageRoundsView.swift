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
                        
                        //TODO: complete the round analysis page for this pop up
                    }
                    
                }
            }
            
            //TODO: fix the back buttons related to this and the add round page
            
            //TODO: fix weird spacing issue when clicking add round
                
                
        
            
        }
    }
        
}

struct ManageRound_Previews: PreviewProvider {
    static var previews: some View {
        ManageRoundsView(listOfRounds: [Round]())
    }
}
