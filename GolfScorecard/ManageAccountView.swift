//
//  ManageAccountView.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2022-12-31.
//

import SwiftUI

struct ManageAccountView: View {
    let golfer: Golfer
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ManageAccountView_Previews: PreviewProvider {
    static var previews: some View {
        ManageAccountView(golfer: Golfer(userID: "yellow", nickname: "Pink", password: "Green"))
    }
}
