//
//  BearGridView.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-01.
//

import SwiftUI

struct BearGridView: View {
    
    var items: [Bear]
    var column: Int = 3
    
    var body: some View {
        
        let columns: [GridItem] = Array(repeating: .init(.flexible()), count: column)
        
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: Dm.small) {
                ForEach(items, id: \.id) { bear in
                    NavigationLink(destination: DetailScreen(bear: bear)) {
                        BearGridItem(bear: bear)
                    }
                }
            }
        }
    }
}

struct BearGridView_Previews: PreviewProvider {
    static var previews: some View {
        BearGridView(items: MockBears)
    }
}
