//
//  HomeViewSlider.swift
//  dCalc
//
//  Created by Daniel Rybak on 21/03/2021.
//

import SwiftUI

struct HomeViewSliderPanel: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    @ObservedObject var calculationManager: CalculationManager
    @ObservedObject var viewTransitionManager: ViewTransitionManager
    
    var body: some View {
        VStack {
            NeumorphicSlider(viewTransitionManager: viewTransitionManager,
                             range: 2.0...40.0,
                             label: "Current",
                             step: 0.1,
                             unitsOfMeasure: "mmol",
                             sliderValue: $calculationManager.currentSugarLevel)
                .padding(.top, 20)
            NeumorphicSlider(viewTransitionManager: viewTransitionManager,
                             range: 4.5...10.0,
                             label: "Target",
                             step: 0.5,
                             unitsOfMeasure: "mmol",
                             sliderValue: $calculationManager.targetSugarLevel)
            NeumorphicSlider(viewTransitionManager: viewTransitionManager,
                             range: 1.0...30.0,
                             label: "Carbs / Unit",
                             step: 1,
                             unitsOfMeasure: "g",
                             sliderValue: $calculationManager.carbsPerUnitOfInsulin)
            NeumorphicSlider(viewTransitionManager: viewTransitionManager,
                             range: 1.0...5.0,
                             label: "Unit / mmol",
                             step: 0.5,
                             unitsOfMeasure: "unit",
                             sliderValue: $calculationManager.mmolPerUnitOfInsulin)
        }
        .background(colorScheme == .dark ? Color.darkStart : Color.whiteEnd)
        .cornerRadius(15)
        .padding(.horizontal, 10)
    }
}

struct HomeViewSlider_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewSliderPanel(calculationManager: CalculationManager(), viewTransitionManager: ViewTransitionManager())
    }
}
