//
//  FloatExtension.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-01.
//

import Foundation
import SwiftUI

extension Float {
    
    func toStringWithDecimal(n: Int) ->  String {
        String(format: "%.\(n)f", self)
    }
    
}

extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
}

extension Date {
    
    func dateToString(_ format: String = "MMM dd yyy") -> String {
        return self.formatToString(format)
    }
        
    func dateToMonthYearString() -> String {
        return self.formatToString("MMM yyy")
    }
    
    private func formatToString(_ format: String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    func isInMonthYear(monthYearString: String) -> Bool {
        return self.dateToMonthYearString() == monthYearString
    }
    
    static func stringToDate(_ dateString: String, _ format: String = "MMM dd yyy") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: dateString)
    }
    
}

extension View {
    
    // allow us to change placeholder color by
    // exameple:
    //    TextField("", text: $text)
    //        .placeholder(when: text.isEmpty) {
    //            Text(placeholder).foregroundColor(.gray)
    //    }
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
    
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
