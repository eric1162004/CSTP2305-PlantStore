//
//  AppTitleBar.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-07.
//

import SwiftUI
import Resolver

struct AppTitleBar: View {
    
    @ObservedObject var appUserViewModel: AppUserViewModel = Resolver.resolve()

    var title: String
    var showUserImage: Bool = false
    
    var body: some View {
        HStack{
            // title
            AppText(text: title, fontSize: FontSize.large, spacing: Dm.tiny, isBold: true)
                .frame(maxWidth: 200, alignment: .leading)
                .padding(.vertical, Dm.tiny)
            
            Spacer()
            
            // user image
            if showUserImage {
                NavigationLink {
                    AccountScreen()
                } label: {
                    if $appUserViewModel.appUser.imageUrl.wrappedValue.isEmpty {
                        AppImageView(iconName: "person.fill")
                            .foregroundColor(Color.white)
                            .frame(width: 25)
                            .padding()
                            .background(Color.primaryColor)
                            .clipShape(Circle())
                        
                    } else {
                        AppAsyncImage(
                            imageUrl: $appUserViewModel.appUser.imageUrl.wrappedValue,
                            width: 60,
                            cornerRadius: 10000 // circle shape
                        )
                    }
                    
                }
            }
            
        }
    }
}

struct AppTitleBar_Previews: PreviewProvider {
    static var previews: some View {
        AppTitleBar(title: "Log\nIn")
        Text("")
    }
}
