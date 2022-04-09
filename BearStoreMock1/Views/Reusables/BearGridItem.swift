//
//  BearGridItem.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-01.
//

import SwiftUI

struct BearGridItem: View {
    
    var bear: Bear
    
    var body: some View {
        VStack{
            // bear image
            Image("bear")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height:100)
            Text(bear.name)
                .fontWeight(.bold)
            Text("\(bear.price.toStringWithDecimal(n: 0))")
        }
    }
}

struct BearGridItem_Previews: PreviewProvider {
    static var previews: some View {
        BearGridItem(bear: MockBear)
    }
}
