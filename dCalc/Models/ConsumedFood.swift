//
//  Products.swift
//  dCalc
//
//  Created by Daniel Rybak on 02/04/2021.
//

import Foundation

class ConsumedFood {
    struct Item: Identifiable {
        var id = UUID()
        var productName: String = ""
        var grammsConsumed: Double = 0
        var grammsPer100g: Double = 0
    }

    var items: [Item] = []
}
