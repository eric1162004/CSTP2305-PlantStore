//
//  PriceInputField.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-01.
//

import SwiftUI

struct PriceInputField: View {
    
    @Binding var text: String
    var title: String = ""
    var height: CGFloat = Dm.xxlarge
    
    var body: some View {
        VStack{
            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack{
                
                TextField(title, text: $text)
                    .keyboardType(.numberPad)
                        
                Text("SOL")
            }
            .padding()
            .frame(maxWidth:.infinity, maxHeight: height)
            .overlay(
                RoundedRectangle(cornerRadius: CornerRadius.small)
                    .stroke(Color.gray, lineWidth: 2)
            )
        }
    }
}

struct PriceInputField_Previews: PreviewProvider {
    static var previews: some View {
        PriceInputField(text: .constant("text"))
    }
}
