//
//  PlantGridView.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-07.
//

import SwiftUI

struct PlantGridView: View {
    
    var items: [Plant]
    var column: Int = 2
    var showEditButton: Bool = false
    
    var body: some View {
        
        let columns: [GridItem] = Array(repeating: .init(.flexible(), alignment: .top), count: column)
        
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns,
                      spacing: Dm.small) {
                ForEach(items, id: \.createdTime) { plant in
                    PlantGridItem(plant: plant,
                                  showEditButton: showEditButton)
                }
            }
        }
        
    }
}

struct PlantGridView_Previews: PreviewProvider {
    static var previews: some View {
        PlantGridView(items: MockPlants)
    }
}
