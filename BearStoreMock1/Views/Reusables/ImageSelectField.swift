//
//  ImageSelectField.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-07.
//

import SwiftUI

struct ImageSelectField: View {
    
    var width: CGFloat = 180
    var height: CGFloat = 180
    var onPressed: (() -> Void)
    
    var body: some View {
        ZStack{
            AppImageView(iconName:"plus")
                .frame(width: 40)
        }
        .frame(width: width, height: height)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: CornerRadius.medium))
        .padding()
        .onTapGesture {
            // onPressed
            onPressed()
        }
    }
}

struct ImageSelectField_Previews: PreviewProvider {
    static var previews: some View {
        ImageSelectField(){}
    }
}
