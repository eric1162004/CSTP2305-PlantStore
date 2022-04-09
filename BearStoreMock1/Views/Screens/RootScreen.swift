//
//  RootScreen.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-01.
//

import SwiftUI
import Resolver

struct RootScreen: View {
    
    @ObservedObject var authService: AuthService = Resolver.resolve()
    
    var body: some View {
        
        if authService.user == nil {
            LaunchScreen()
        } else {
            HomeScreen()
        }
    }
}

struct RootScreen_Previews: PreviewProvider {
    static var previews: some View {
        RootScreen()
    }
}
