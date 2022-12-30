//
//  NewAccountView.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2022-12-28.
//

import SwiftUI

struct NewAccountView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var passwordCheck: String = ""
    var body: some View {
        NavigationView {
            VStack {
                
                
                Form {
                    Section(header: Text("Username")) {
                        TextField("Enter User ID", text: $username)
                    }
                    
                    Section(header: Text("Password")) {
                        
                        TextField("Enter Password", text: $password)
                        TextField("Re-Enter Password", text: $passwordCheck)
                    }
                    
                    
                }
                
            
                
                
                NavigationLink(destination: LoginView()) {
                    Label("Cancel", systemImage: "clear.fill")
                        .foregroundColor(.red)
                    
                }
                .padding(.bottom, 10.0)
                .navigationBarBackButtonHidden()
                
                
                
                
                Button (action: {
                    //TODO: attempt to add user
                }) {
                    Label("Save", systemImage: "checkmark")
                }
                .bold()
            }
            .navigationTitle("New User")
        }
        .navigationBarBackButtonHidden()
        
        
        
        
        
    }
    
    struct NewAccountView_Previews: PreviewProvider {
        static var previews: some View {
            NewAccountView()
        }
    }
}
