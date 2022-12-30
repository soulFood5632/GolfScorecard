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
                    Section(header: Text("Add")) {
                        NavigationLink(destination: AddRoundSetupView()) {
                            Label("Add Round", systemImage: "pencil.line")
                                .font(.headline)
                        }
                    }
                    Section(header: Text("Edit")) {
                        NavigationLink(destination: ListEditView()) {
                            Label("View/Edit Rounds", systemImage: "pencil")
                                .font(.headline)
                        }
                        
                    }
                    
                }
                .navigationTitle("Manage Rounds")
                
                if(listOfRounds.isEmpty){
                    
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
