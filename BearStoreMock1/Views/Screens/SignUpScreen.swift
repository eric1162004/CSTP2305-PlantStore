//
//  SignUpScreen.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-01.
//

import SwiftUI
import Resolver

struct SignUpScreen: View {
    
    // allow us to pop the current view off the navigation stack
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack(spacing: Dm.tiny) {
            Spacer()
            
            // title
            AppText(text: "SIGN UP", fontSize: FontSize.large, spacing: Dm.tiny, isBold: true)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.vertical, Dm.small)
            
            FormSection()
            
            // navigate to login screen
            HStack{
                AppHyperLink(label: "Already have an account?", color: Color.primaryColor){
                    presentation.wrappedValue.dismiss()
                }
            }
            .foregroundColor(Color.black)
            .padding(.vertical, Dm.small)
            
            Spacer()
            
        }
        .onTapGesture {
            hideKeyboard()
        }
        .ignoresSafeArea()
        .padding()
        .background(Color.backgroundColor)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

private struct FormSection: View {
    
    @ObservedObject var authService: AuthService = Resolver.resolve()
    @ObservedObject var appUserViewModel: AppUserViewModel = Resolver.resolve()
    
    @State private var email: String = ""
    @State private var confirmEmail: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    @State var errorMsg : String?
    
    private func registerUser() {
        
        errorMsg = nil
        
        // ensure not empty fields
        guard !email.isEmpty && !password.isEmpty && !confirmPassword.isEmpty else {
            errorMsg = "Fields cannot be empty."
            return
        }
        
        // ensure passwords are matching
        guard email == confirmEmail else {
            errorMsg = "Passwords are not matching."
            return
        }
        
        // ensure passwords are matching
        guard password == confirmPassword else {
            errorMsg = "Passwords are not matching."
            return
        }
        
        authService.signUp(email: email, password: password, onError: { error in
            errorMsg = "\(error.localizedDescription)"
        }, onSuccess: {
            appUserViewModel.add(AppUser(name: "", email: email))
        })
    }
    
    var body: some View {
        // email
        InputField(text:$email, placeHolder: "EMAIL")
        
        // confirm email
        InputField(text:$confirmEmail, placeHolder: "CONFIRM EMAIL")
        
        // password
        InputField(text:$password, placeHolder: "PASSWORD", isPasswordField: true)
        
        // confirm password
        InputField(text:$confirmPassword, placeHolder: "COMFIRM PASSWORD", isPasswordField: true)
        
        // error message
        if let errorMsg = errorMsg {
            AppText(text: errorMsg, fontColor: Color.appRed, isBold: true)
        }
        
        // Sign Up App User
        AppCapsuleButton(label:"SIGN UP"){
            registerUser()
        }
        .padding(.vertical, Dm.medium)
    }
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen()
    }
}
