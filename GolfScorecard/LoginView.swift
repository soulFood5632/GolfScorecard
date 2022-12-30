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
                    .padding(.top, 3)
                    .padding(.bottom, 75)
                
        
                
                TextField("User ID", text: $userID)
                    .textFieldStyle(.roundedBorder)
                    
                    .padding(.leading)
                    .padding(.trailing)
                    .padding(.bottom)
                    
                    
                
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
