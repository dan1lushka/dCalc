//
//  CalculationManager.swift
//  dCalc
//
//  Created by Daniel Rybak on 02/04/2021.
//

import SwiftUI

class CalculationManager: ObservableObject {
    @Published var currentSugarLevel: Double = 5.5
    @Published var targetSugarLevel: Double = 5.5
    @Published var carbsPerUnitOfInsuline: Double = 10.0
    @Published var dosage = 0

    @Published var productName = ""
    @Published var grammsConsumed = ""
    @Published var grammsPer100g = ""
    
    var products = Products()
}
