//
//  TabItemView.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-08.
//

import SwiftUI

struct TabItemView: View {
    
    var iconName: String = ""
    var title: String = ""
    
    var body: some View {
        VStack{
            Image(systemName: iconName)
            Text(title)
        }
    }
}

struct TabItemView_Previews: PreviewProvider {
    static var previews: some View {
        TabItemView()
    }
}
