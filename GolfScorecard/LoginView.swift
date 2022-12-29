//
//  ContentView.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2022-12-15.
//

import SwiftUI

struct LoginView: View {
    
    @State private var userID: String = ""
    @State private var password: String = ""
    
    
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                
                
                Text("40 Yards Left")
                    .bold()
                    .font(.largeTitle)
                    .padding()
                
                //TODO: ADD 40 yards left image
                
                Text("Please Login Below")
                    .font(.title3)
                    .padding(.top, 60)
                    
                Image(systemName: "arrow.down")
                    .padding(.top, 10)
                    .padding(.bottom, 65)
                    //TODO: Add animation
                
                
                
                
                
                TextField("User ID", text: $userID)
                    
                    .padding(.leading)
                    .padding(.trailing)
                    .padding(.bottom)
                    .textFieldStyle(.roundedBorder)
                    
                
                Button ("Check User ID") {
                    //TODO: Make animation to expose password entry
                    
                }
                .buttonStyle(.borderedProminent)
                
                .disabled(userID.isEmpty)
                .fontWeight(.regular)
                
                
                Spacer()
                
                
                NavigationLink(destination: NewAccountView()) {
                    Text("New User")
                    
                }
                .padding()
                
                
                
            }
            
            
        }
        .navigationBarBackButtonHidden()
    }
    
    
    
    
    
}
    
        
    


struct Login_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
