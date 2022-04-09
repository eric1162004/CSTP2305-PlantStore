//
//  FindPlantsScreen.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-07.
//

import SwiftUI
import Resolver

struct FindPlantsScreen: View {
    
    @ObservedObject var vm : PlantViewModel = Resolver.resolve()
    @ObservedObject var appUserViewModel: AppUserViewModel = Resolver.resolve()
    
    @State private var searchText = ""
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            // title
            AppTitleBar(title: "FIND\nPLANTS", showUserImage: true)
            
            // seach bar
            InputField(text: $searchText, placeHolder: "search", leadingIcon: "magnifyingglass")
                .onChange(of: searchText) { newValue in
                    vm.search(searchText)
                }
            
            // item grid
            PlantGridView(items:vm.plants)
        }
        
    }
}

struct FindPlantsScreen_Previews: PreviewProvider {
    static var previews: some View {
        FindPlantsScreen()
    }
}
