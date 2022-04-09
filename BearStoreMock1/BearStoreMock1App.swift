//
//  BearStoreMock1App.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-01.
//

import SwiftUI

@main
struct BearStoreMock1App: App {
    
    // Set up Firebase when finish launch, see appDelegate
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            RootScreen()
        }
    }
}
