//
//  AddRoundView.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2022-12-28.
//

import SwiftUI

struct AddRoundSetupView: View {
    @State private var countrySearch = ""
    @State private var provinceSearch = ""
    @State private var citySearch = ""
    @State private var nameSearch = ""
    
    @State private var courseName = ""
    @State private var countryName = ""
    @State private var provinceName = ""
    @State private var cityName = ""
    
    
    @State private var teeName = ""
    @State private var rating = ""
    @State private var slope = ""
    
    @State private var isHoleDataClicked = false
    
    
    
    
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Pick From Previous")) {
                    TextField("Search via Country", text: $countrySearch)
                    TextField("Search via Province", text: $provinceSearch)
                    TextField("Search via City", text: $citySearch)
                    TextField("Search via Course Name", text: $nameSearch)
                    
                    //TODO: Change to value from drop down. think MP1
                    
                    
                }
                Section(header: Text("Create New Course")) {
                    
                    
                    TextField("Course Name", text: $nameSearch)
                    
                    
                    TextField("City", text: $cityName)
                    HStack {
                        
                        TextField("Province/State", text: $provinceName)
                        TextField("Country", text: $provinceName)
                    }
                    
                    HStack {
                        TextField("Tee Name", text: $teeName)
                        Spacer()
                        TextField("Rating", text: $rating)
                        TextField("Slope", text: $slope)
                    }
                    
                    
                    
                    
                    Button("Add/Edit Hole Data") {
                        isHoleDataClicked = true
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(isValidTeeEntry())
                    
                    
                    
                    
                    
                    
                }
            }
            .navigationTitle("Add Round")
            .sheet(isPresented: $isHoleDataClicked) {
                Form {
                    
                }
                
            }
            
        }
        
    }
    
    
    /**
     Finds if there exists a valid entry to a tee
     */
    private func isValidTeeEntry() -> Bool {
        if teeName.isEmpty || rating.isEmpty || slope.isEmpty {
            return false
        }
        var intSlope: Int
        var doubleRating: Double
        if let intSlope = Int(slope) {
            
            if intSlope < 55 || intSlope > 155 {
                return false
            }
            if let doubleRating = Double(rating){
                return true
            }
            return false
        }
        return false
        
    }
}



struct AddRoundSetupView_Previews: PreviewProvider {
    static var previews: some View {
        AddRoundSetupView()
    }
}
