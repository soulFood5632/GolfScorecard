//
//  AddRoundView.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2022-12-28.
//

import SwiftUI

struct ManageRoundsView: View {
    var body: some View {
        
        List {
            NavigationLink(destination: AddRoundView()) {
                Label("Add Round", systemImage: "plus.circle.fill")
                    .font(.headline)
            }
            
        }
        .navigationTitle("Manage Rounds")
    }
}

struct ManageRound_Previews: PreviewProvider {
    static var previews: some View {
        ManageRoundsView()
    }
}
