//
//  LaunchScreen.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-06.
//

import SwiftUI

struct LaunchScreen: View {
    
    var body: some View {
        NavigationView{
            VStack(spacing: Dm.medium){
                Spacer()
                
                // Title
                HStack{
                    AppText(text:"TOBY'S PLANTS BROS", fontSize:FontSize.medium, spacing: Dm.tiny, isBold: true)
                        .frame(width: Dm.large * 5)
                    Spacer()
                }
                .offset(y: Dm.xxlarge)
                .zIndex(1)
                
                // Image
                AppImageView(imageName:"launch-pic")
                
                // Subtitle
                AppText(text:"Discover what you need to know about plants. Take care of Toby and his friends, otherwise, they will not treat you with kindness.", isBold:true)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, Dm.xxlarge)
                
                // to login screen
                NavigationLink {
                    LoginScreen()
                } label: {
                    AppCapsuleButton(label: "GET STARTED")
                }

                Spacer()
                
            }
            .ignoresSafeArea()
            .padding(.horizontal, Dm.medium)
            .background(Color.backgroundColor)
            .navigationBarHidden(true)
        }
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}
