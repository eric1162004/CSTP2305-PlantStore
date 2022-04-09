//
//  MyPlantsScreen.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-07.
//

import SwiftUI
import Resolver

struct MyPlantsScreen: View {
    
    @ObservedObject var vm : PlantViewModel = Resolver.resolve()

    @State private var searchText = ""
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            // title
            AppTitleBar(title: "MY\nPLANTS", showUserImage: true)
            
            // seach bar
            InputField(text: $searchText, placeHolder: "search", leadingIcon: "magnifyingglass")
                .onChange(of: searchText) { newValue in
                    vm.searchMyPlants(searchText)
                }
            
            PlantGridView(items: vm.myPlants, showEditButton: true)
        }
    }
}

struct MyPlantsScreen_Previews: PreviewProvider {
    static var previews: some View {
        MyPlantsScreen()
    }
}
