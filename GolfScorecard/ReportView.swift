//
//  ReportView.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2022-12-30.
//

import SwiftUI

struct ReportView: View {
    
    let listOfRounds: [Round]
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView(listOfRounds: Golfer.sampleGolfer.getRounds())
    }
}
