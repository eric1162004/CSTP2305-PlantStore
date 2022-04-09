//
//  LoginScreen.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-01.
//

import SwiftUI
import Resolver

struct LoginScreen: View {
    
    /// <#Description#>
    var body: some View {
        VStack(spacing:Dm.small) {
            Spacer()
            
            // title
            AppText(text: "LOG IN", fontSize: FontSize.large, spacing: Dm.tiny, isBold: true)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.vertical, Dm.small)
            
            FormSection()
            
            SocialMediaSection()
            
            // navigate to sign up screen
            HStack{
                AppHyperLink(label: "Don't have an account?")
                NavigationLink(destination: SignUpScreen()) {
                    AppHyperLink(label: "Create one.", color: Color.primaryColor)
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
        .padding(.horizontal, Dm.large)
        .background(Color.backgroundColor)
        .navigationBarBackButtonHidden(true)
    }
}

private struct FormSection: View {
    
    @ObservedObject var authService: AuthService = Resolver.resolve()
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var rememberMe: Bool = false
    
    @State var errorMsg : String?
    
    private func loginUser() {
        
        errorMsg = nil
        
        // ensure not empty fields
        guard !email.isEmpty && !password.isEmpty else {
            errorMsg = "Fields cannot be empty."
            return
        }
        
        authService.signIn(email: email, password: password, onError: { error in
            errorMsg = "\(error.localizedDescription)"
        }, onSuccess: {})
    }
    
    var body: some View {
        // email
        InputField(text:$email, placeHolder: "EMAIL")
        
        // password
        InputField(text:$password, placeHolder: "PASSWORD", isPasswordField: true)
        
        // remember me checkbox
        HStack{
            CheckView(isChecked: $rememberMe, label: "remember me", fontSize: FontSize.xtiny)
            Spacer()
            AppHyperLink(label:"Forget password?", color: Color.primaryColor)
        }
        
        // error message
        if let errorMsg = errorMsg {
            AppText(text: errorMsg, fontColor: Color.appRed, isBold: true)
        }
        
        AppCapsuleButton(label:"Login"){
            loginUser()
        }
        .padding(.vertical, Dm.medium)
    }
}

private struct SocialMediaSection: View {
    
    var body: some View {
        // Google icon
        HStack {
            Seperator(color: Color.primaryColor)
            Spacer()
            AppHyperLink(label: "or sgin in with")
            Spacer()
            Seperator(color: Color.primaryColor)
        }
        
        // Facebook icon
        HStack(spacing: Dm.medium){
            AppImageView(imageName: "facebook-icon")
                .frame(width: 40)
            AppImageView(imageName: "google-icon")
                .frame(width: 40)
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
