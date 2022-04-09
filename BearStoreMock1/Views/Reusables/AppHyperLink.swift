//
//  AppHyperLink.swift
//  MoneyBee
//
//  Created by Eric Cheung on 2022-01-28.
//

import SwiftUI

struct AppHyperLink: View {
    
    var label: String
    var color: Color = .black
    var handlePress: (() -> ())?
    
    var body: some View {
        if let handler = handlePress {
            Button {
                handler()
            } label: {
                AppText(text:label, fontSize: FontSize.xtiny, fontColor: color)
            }
        } else {
            AppText(text:label, fontSize: FontSize.xtiny, fontColor: color)
        }
    }
}

struct AppHyperLink_Previews: PreviewProvider {
    static var previews: some View {
        AppHyperLink(label: "Click me")
    }
}
