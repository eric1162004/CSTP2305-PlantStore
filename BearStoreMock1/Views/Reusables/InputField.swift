//
//  InputField.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-01.
//

import SwiftUI

struct InputField: View {
    
    @Binding var text: String
    var title: String = ""
    var placeHolder: String = ""
    var leadingIcon: String?
    var trailingIcon: String?
    var onTrailingIocnPressed: (()->Void)?
    var isPasswordField: Bool = false
    var backgroundColor: Color = Color.white
    var borderColor: Color = .clear
    var cornerRadius: CGFloat = CornerRadius.medium
    var height: CGFloat = Dm.xxlarge
    
    /// <#Description#>
    var body: some View {
        VStack{
            AppText(text: title)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            if(!isPasswordField){
                HStack{
                    if let leadingIcon = leadingIcon {
                        Image(systemName: leadingIcon)
                    }
                    
                    TextField(placeHolder, text: $text)

                    if let trailingIcon = trailingIcon {
                        Image(systemName: trailingIcon)
                            .onTapGesture {
                                onTrailingIocnPressed?()
                            }
                    }
                }
                .padding()
                .frame(
                    maxWidth:.infinity,
                    minHeight: height,
                    alignment: .topLeading)
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(borderColor, lineWidth: 2)
                    )
                .background(backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                .autocapitalization(.none)
                
            } else {
                SecureField(
                    placeHolder,
                    text: $text
                )
                    .padding()
                    .frame(maxWidth:.infinity, minHeight: height)
                    .overlay(
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .stroke(borderColor, lineWidth: 2)
                    )
                    .background(backgroundColor)
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                    .autocapitalization(.none)
            }
        }
    }
}

struct InputField_Previews: PreviewProvider {
    
    static var previews: some View {
        InputField(text: .constant("text"))
    }
}
