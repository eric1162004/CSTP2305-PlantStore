//
//  RoundedCornerButton.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-01.
//

import SwiftUI

struct RoundedCornerButton: View {
    
    var label: String
    var backgroundColor: Color = Color.primary
    var width: CGFloat = .infinity
    var labelColor: Color = Color.white
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            RoundedRectangle(cornerRadius: CornerRadius.small, style: .continuous)
                .fill(backgroundColor)
                .overlay{
                    Text(label)
                        .font(.system(size:FontSize.small))
                        .foregroundColor(labelColor)
                        .fontWeight(.bold)
                }
                .frame(maxWidth: width, maxHeight: Dm.xxlarge)
        }    }
}

struct RoundedCornerButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedCornerButton(label:"press me", action: {print("pressed")})
    }
}
