//
//  ListingScreen.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-01.
//

import SwiftUI
import Resolver

struct ListingScreen: View {
    
    @ObservedObject var authService: AuthService = Resolver.resolve()
    @ObservedObject var vm : BearViewModel = Resolver.resolve()

    @State private var searchText = ""
    
    /// <#Description#>
    var body: some View {
        NavigationView{
            VStack{
                // search bar
                InputField(text: $searchText, placeHolder: "search", leadingIcon: "magnifyingglass", trailingIcon: "mic", onTrailingIocnPressed: {
                    // search 
                    vm.search(searchText)
                })
                
                // title
                Text("Toys")
                    .font(.system(size:FontSize.xlarge))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // Grid of Bears
                BearGridView(items: vm.bears)
                
                RoundedCornerButton(label: "Sign out"){
                    authService.signOut()
                }
                
                Spacer()
            }
            .padding(.horizontal)
            .navigationBarHidden(true)
        }
    }
}

struct ListingScreen_Previews: PreviewProvider {
    static var previews: some View {
        ListingScreen()
    }
}
