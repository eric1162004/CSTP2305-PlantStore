//
//  MockData.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-01.
//

import Foundation
import SwiftUI

var MockBear = Bear(name: "Mock Bear",
                    description: "This is a cute mock bear. please buy me. I will make you very happy.",
                    price: 10,
                    condition: 3)

var MockBears = [
    MockBear,
    MockBear,
    MockBear,
    MockBear,
    MockBear,
    MockBear,
    MockBear,
    MockBear,
    MockBear
]

var MockPlant = Plant(name: "Mock Plant",
                      description: "This is a cute mock plant. please buy me. I will make you very happy.",
imageUrl: "https://media.istockphoto.com/photos/tree-picture-id543052538?k=20&m=543052538&s=612x612&w=0&h=X3m-COQRykkX19_LAJRVEZ902bA4M_qbkMtWCO3IHRw=")

var MockPlants = [
    MockPlant,
    MockPlant,
    MockPlant,
    MockPlant,
    MockPlant,
    MockPlant
]
