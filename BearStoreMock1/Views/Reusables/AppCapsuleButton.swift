//
//  AppCapsuleButton.swift
//  MoneyBee
//
//  Created by Eric Cheung on 2022-01-28.
//

import SwiftUI

struct AppCapsuleButton: View {
    
    let label: String
    var width: CGFloat = Dm.xxlarge * 3
    var height: CGFloat = Dm.medium
    var fontSize: CGFloat = FontSize.tiny
    var backgroundColor: Color = Color.primaryColor
    var padding: CGFloat = Dm.tiny
    var handlePressed: (() -> ())?
    
    var body: some View {
        
        if let handlePressed = handlePressed {
            Button(action: {
                handlePressed()
            }){
                AppText(
                    text:label,
                    fontSize:fontSize,
                    fontColor: .white)
                    .frame(maxWidth: width,
                           maxHeight: height,
                           alignment: .center)
                    .padding(.vertical, padding)
                    .background(backgroundColor)
                    .cornerRadius(CornerRadius.xlarge)
            }
        }
        else {
            AppText(
                text:label,
                fontSize:fontSize,
                fontColor: .white)
                .frame(maxWidth: width,
                       maxHeight: height,
                       alignment: .center)
                .padding(.vertical, padding)
                .background(backgroundColor)
                .cornerRadius(CornerRadius.xlarge)
        }
    }
}

struct AppCapsuleButton_Previews: PreviewProvider {
    static var previews: some View {
        AppCapsuleButton(label: "Click me", backgroundColor: Color.primaryColor){
            print("pressed")
        }
    }
}
