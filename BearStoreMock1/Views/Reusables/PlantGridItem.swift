//
//  PlantGridItem.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-07.
//

import SwiftUI

struct PlantGridItem: View {
    
    var plant: Plant
    var showEditButton: Bool = false
    
    var body: some View {
        VStack(alignment: .leading){
            
            AppAsyncImage(imageUrl: plant.imageUrl, cornerRadius: 20)
            
            VStack(alignment:.leading){
                AppText(text: plant.name, fontSize:FontSize.tiny, isBold: true)
                AppText(text: plant.description)
            }
            
            if showEditButton{
                NavigationLink {
                    EditScreen(plant: plant)
                } label: {
                    AppCapsuleButton(label: "EDIT", width: 60, height: 20, fontSize: FontSize.xtiny)
                }
            }
            
            Spacer()
        }
    }
}

struct PlantGridItem_Previews: PreviewProvider {
    static var previews: some View {
        PlantGridItem(plant: MockPlant)
    }
}
