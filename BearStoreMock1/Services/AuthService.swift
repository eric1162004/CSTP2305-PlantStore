//
//  AuthService.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-01.
//

import Foundation
import Firebase

class AuthService: ObservableObject {
    
    let auth = Auth.auth()
    
    @Published var user: User?
    
    init() {
        // listen to fireauth changes
        self.registerStateListener()
    }
    
    func signIn(
        email: String,
        password: String,
        onError: @escaping ((Error) -> Void),
        onSuccess: @escaping (() -> Void)
    ){
        auth.signIn(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else {
                onError(error!)
                return
            }
            
            // Success
            print("User has signed in.")
            onSuccess()
        }
    }
    
    func signUp(
        email: String,
        password: String,
        onError: @escaping ((Error) -> Void),
        onSuccess: @escaping (() -> Void)
    ){
        auth.createUser(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else {
                onError(error!)
                return
            }
            // sucess
            print("User has signed up.")
            onSuccess()
        }
    }
    
    func signOut(){
        try? auth.signOut()
    }
    
    private func registerStateListener(){
        Auth.auth().addStateDidChangeListener { auth, user in
            print("Sign in state has changed.")
            self.user = user
            
            if let user = user{
                let anonymous = user.isAnonymous ? "anonymously" : ""
                print("User signed in \(anonymous) with user ID \(user.uid)")
            }
            else {
                print("User signed out.")
            }
        }
    }
    
}
