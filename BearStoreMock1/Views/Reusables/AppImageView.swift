//
//  AppImageSelector.swift
//  MoneyBee
//
//  Created by Eric Cheung on 2022-01-29.
//

import SwiftUI

struct AppImageView: View {
    
    var uiImage: UIImage?
    var imageName: String?
    var iconName: String?
    
    var body: some View {
            if let uiImage = uiImage {
                
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
            }
            else if let imageName = imageName {
                
                // return image
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                
            }
            else if let iconName = iconName {
                
                // return a icon image
                Image(systemName: iconName)
                    .resizable()
                    .scaledToFit()
            }
            else {
                // if both imageName and iconName are not provided, then return a placeholder image
                Image(systemName: "photo.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .padding()
            }
        
    }
}

struct AppImageSelector_Previews: PreviewProvider {
    static var previews: some View {
        AppImageView(iconName: "person")
    }
}
