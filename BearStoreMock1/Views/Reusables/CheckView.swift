//
//  CheckView.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-07.
//

import SwiftUI

struct CheckView: View {
    
    @Binding var isChecked:Bool
    var label:String
    var fontSize: CGFloat = FontSize.small
    var color: Color = Color.primaryColor
    
    func toggle(){isChecked = !isChecked}
    
    var body: some View {
        Button(action: toggle){
            HStack{
                Image(systemName: isChecked ? "checkmark.square": "square")
                AppText(text: label, fontSize: fontSize, fontColor: color)
            }
            .foregroundColor(color)
        }

    }

}

struct CheckView_Previews: PreviewProvider {
    static var previews: some View {
        CheckView(isChecked: .constant(false), label:"buy?")
    }
}
