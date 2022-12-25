//
//  ContentView.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2022-12-15.
//

import SwiftUI

struct LoginView: View {
    
    @State private var userID: String = ""
    @FocusState private var IDFocus: Bool
    
    var body: some View {
        TextField("User ID", text: $userID)
            .focused($IDFocus)
            .onSubmit {
                <#code#>
            }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
