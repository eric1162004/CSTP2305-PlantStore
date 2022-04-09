//
//  PlantsCareScreen.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-07.
//

import SwiftUI
import Resolver

struct PlantsCareScreen: View {
    
    @ObservedObject var vm : BearViewModel = Resolver.resolve()

    @State private var searchText = ""
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            // title
            AppTitleBar(title: "PLANTS\nCARE", showUserImage: true)
            
            // seach bar
            InputField(text: $searchText, placeHolder: "search", leadingIcon: "magnifyingglass", trailingIcon: "mic", onTrailingIocnPressed: {
                // search
                vm.search(searchText)
            })
            
            PlantGridView(items:MockPlants)
        }
    }
}

struct PlantsCareScreen_Previews: PreviewProvider {
    static var previews: some View {
        PlantsCareScreen()
    }
}
