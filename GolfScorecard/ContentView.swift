//
//  ContentView.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2022-12-15.
//

import SwiftUI

struct LoginView: View {
    
    @State private var userID: String = ""
    
    
    var body: some View {
        VStack {
            
            TextField("User ID", text: $userID)
                .onSubmit {
                    
                }
                .padding()
            
                
            
            
            
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
