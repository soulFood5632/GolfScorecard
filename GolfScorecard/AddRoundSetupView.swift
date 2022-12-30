//
//  AddRoundView.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2022-12-28.
//

import SwiftUI

struct AddRoundSetupView: View {
    @State private var courseListView = false
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Pick From Previous")) {
                    Button {
                        
                    } label: {
                        Label("From Database", systemImage: "")
                    }
                    
                }
            }
            .sheet(isPresented: $courseListView) {
                
            }
        }
        .navigationTitle("Add Round")
    }
}

struct AddRoundSetupView_Previews: PreviewProvider {
    static var previews: some View {
        AddRoundSetupView()
    }
}
