//
//  HomeScreen.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-01.
//

import SwiftUI

struct HomeScreen: View {
    
    var body: some View {
        TabView {
            
            // Find Plant Screen
            NavigationView{
                FindPlantsScreen()
                    .padding()
                    .background(Color.backgroundColor)
                    .navigationBarHidden(true)
            }
            .tabItem {
                TabItemView(iconName: "magnifyingglass", title: "FIND PLANTS")
            }
            
            // Post Plant Screen
            NavigationView{
                PostScreen()
                    .padding()
                    .background(Color.backgroundColor)
                    .navigationBarHidden(true)
            }
            .tabItem {
                TabItemView(iconName: "plus.circle", title: "ADD PLANTS")
            }
            
            // Plant Care Screen
            NavigationView{
                PlantsCareScreen()
                    .padding()
                    .background(Color.backgroundColor)
                    .navigationBarHidden(true)
            }
            .tabItem {
                TabItemView(iconName: "scissors", title: "PLANTS CARE")
            }
            
            // My Plants Screen
            NavigationView{
                MyPlantsScreen()
                    .padding()
                    .background(Color.backgroundColor)
                    .navigationBarHidden(true)
            }
            .tabItem {
                TabItemView(iconName: "globe.americas", title: "MY PLANTS")
            }
            
        }
        .ignoresSafeArea()
        .onAppear() {
            // set tabBar background color
//            UITabBar.appearance().barTintColor = UIColor(Color.white)
            UITabBar.appearance().backgroundColor = UIColor(Color.white)
        }
        // set tabBar tint color
        .accentColor(Color.primaryColor)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
