//
//  Constants.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-01.
//

import Foundation
import SwiftUI

struct Fonts {
    static let GudeaBold = "Gudea-Bold"
    static let GudeaReg = "Gudea-Regular"
}

extension Color {
    static let primaryColor = Color("appPrimaryColor")
    static let backgroundColor = Color("appBackgroundColor")
    static let appRed = Color("appRed")
}

// FontSize
struct FontSize {
    static let xtiny: CGFloat = 15
    static let tiny: CGFloat = 20
    static let small: CGFloat = 25
    static let medium: CGFloat = 30
    static let large: CGFloat = 35
    static let xlarge: CGFloat = 45
    static let xxlarge: CGFloat = 60
}

// Dimensions for margin
struct Dm {
    static let xtiny: CGFloat = 5
    static let tiny: CGFloat = 10
    static let small: CGFloat = 15
    static let mediumSmall: CGFloat = 20
    static let medium: CGFloat = 25
    static let large: CGFloat = 35
    static let xlarge: CGFloat = 45
    static let xxlarge: CGFloat = 55
}

// Corner Radius
struct CornerRadius {
    static let small: CGFloat = 10
    static let medium: CGFloat = 20
    static let large: CGFloat = 30
    static let xlarge: CGFloat = 50
}

// Icon size
struct IconSize {
    static let small: CGFloat = 35
    static let medium: CGFloat = 40
    static let large: CGFloat = 45
    static let xlarge: CGFloat = 50
}
