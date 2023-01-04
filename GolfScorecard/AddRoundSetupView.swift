//
//  AddRoundView.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2022-12-28.
//

import SwiftUI

struct AddRoundSetupView: View {
    
//    let container = NSPersistentContainer(name: "DataModel")
    
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
    
    
    //TODO: figure out how to hid one of these sections when you start to type in the other. Think those blue arrows I accidentily made earlier
    
    
    
    
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Pick From Previous")) {
                    TextField("Search via Country", text: $countrySearch)
                    TextField("Search via Province", text: $provinceSearch)
                    TextField("Search via City", text: $citySearch)
                    TextField("Search via Course Name", text: $nameSearch)
                    
                    //TODO: Change to value from drop down. think MP1
                    
                    //TODO: figure out a way to autopopulate the the bottom section once one had been clicked
                    
                    
                }
                Section(header: Text("Create New Course")) {
                    
                    VStack {
                        
                        
                        TextField("Course Name", text: $courseName)
                        
                        
                        TextField("City", text: $cityName)
                        HStack {
                            
                            TextField("Province/State", text: $provinceName)
                            TextField("Country", text: $countryName)
                        }
                        
                        Button("Add Course") {
                            //TODO: add the add course to database peice
                            
                            //TODO: add animation to lock these values into to stone
                            
                            //TODO: add animation to open up the add tee box option
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(true)
                        
                        //TODO: add animation for disabled button
                        
                        
                    }
                    
                    VStack {
                        
                        //TODO: add animation to lock in teebox. After adding holebyhole data include the yardage in the above section
                        
                        //TODO: Also add a button (or maybe a drop down to select a tee and start the round)
                        
                        //TODO: Make sure the disabled button works
                        
                        HStack {
                            TextField("Tee Name", text: $teeName)
                            Spacer()
                            TextField("Rating", text: $rating)
                            TextField("Slope", text: $slope)
                            
                        }
                        Button("Add Hole Data") {
                            isHoleDataClicked = true
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(isValidTeeEntry())
                    }
                    
                    
                    
                    
                    
                    
                    //TODO: Fix this isVaidTeeEntryBug
                    
                    
                    
                    
                    
                    
                }
            }
            .navigationTitle("Choose Course")
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
