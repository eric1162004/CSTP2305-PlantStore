//
//  AccountScreen.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-07.
//

import SwiftUI
import Resolver

struct AccountScreen: View {
    
    @ObservedObject var authService: AuthService = Resolver.resolve()
    @ObservedObject var appUserViewModel: AppUserViewModel = Resolver.resolve()
    
    @State private var showingPhotoPicker =  false
    
    var body: some View {
        VStack{
            AppTitleBar(title: "My\nAccount")
            
            if appUserViewModel.selectedImage == nil {
                
                if(appUserViewModel.appUser.imageUrl.isEmpty){
                    AppImageView(iconName: "person.fill")
                        .foregroundColor(Color.white)
                        .frame(width: 60)
                        .padding()
                        .background(Color.primaryColor)
                        .clipShape(Circle())
                        .onTapGesture {
                            showingPhotoPicker.toggle()
                        }
                    
                }else {
                    AysncImageLoader(imageUrl: appUserViewModel.appUser.imageUrl)
                        .scaledToFit()
                        .frame(width: 150, height: 150, alignment: .center)
                        .background(.white)
                        .clipShape(Circle())
                        .padding(.bottom)
                        .onTapGesture {
                            showingPhotoPicker.toggle()
                        }
                }
                
            } else {
                // show image selected by user
                AppImageView(uiImage: appUserViewModel.selectedImage)
                    .frame(width: 120)
                    .clipShape(Circle())
            }
            
            // user name field
            InputField(text: $appUserViewModel.appUser.name, placeHolder: "NAME", backgroundColor: Color.white)
                .padding(.horizontal, Dm.medium)
            
            // email
            AppText(text: appUserViewModel.appUser.email, fontSize: FontSize.xtiny, spacing:Dm.xtiny)
            
            Spacer()
            
            AppCapsuleButton(label: "LOG OUT"){
                // logout pressed
                authService.signOut()
            }
            .padding()
            
        }
        .sheet(isPresented: $showingPhotoPicker) {
            PhotoPicker(image: $appUserViewModel.selectedImage)
        }
        .onDisappear(perform: {
            // update fields
            appUserViewModel.update()
        })
        .ignoresSafeArea()
        .padding()
        .background(Color.backgroundColor)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AccountScreen_Previews: PreviewProvider {
    static var previews: some View {
        AccountScreen()
    }
}
