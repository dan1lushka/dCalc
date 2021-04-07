//
//  CalculationManager.swift
//  dCalc
//
//  Created by Daniel Rybak on 02/04/2021.
//

import SwiftUI

class CalculationManager: ObservableObject {
    
    @Published var currentSugarLevel: Double = 7.0
    @Published var targetSugarLevel: Double = 5.5
    @Published var carbsPerUnitOfInsulin: Double = 10.0
    @Published var mmolPerUnitOfInsulin: Double = 3.0
    
    @Published var dosage = 0

    @Published var productName = ""
    @Published var grammsConsumed = ""
    @Published var grammsPer100g: String  = ""
    
    @Published var consumedFoodItems = ConsumedFood()
    
    func getDosage() -> Int {
        if currentSugarLevel <= targetSugarLevel {
            return 0
        }
        
        let totalCarbs = consumedFoodItems.items.map({ $0.grammsConsumed / 100 * $0.grammsPer100g }).reduce(0.0, +)
        
        let unitsForTotalCarbs = totalCarbs / carbsPerUnitOfInsulin
        
        let currentToTargetSugarLevelDifference = currentSugarLevel - targetSugarLevel
        
        let unitsOfInsulinForSugarLevelDifference = currentToTargetSugarLevelDifference / mmolPerUnitOfInsulin
        
        let result = unitsForTotalCarbs + unitsOfInsulinForSugarLevelDifference

        return Int(result)
    }
}
