//
//  Seperator.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-07.
//

import SwiftUI

struct Seperator: View {
    
    let horizontalPadding: CGFloat
    let color: Color

    init(_ horizontalPadding: CGFloat = 20, color: Color = .gray) {
        self.horizontalPadding = horizontalPadding
        self.color = color
    }
    
    var body: some View {
        VStack { Divider().background(color) }.padding(horizontalPadding)
    }
}

struct Seperator_Previews: PreviewProvider {
    static var previews: some View {
        Seperator()
    }
}
