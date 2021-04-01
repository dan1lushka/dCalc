//
//  HomeViewSlider.swift
//  dCalc
//
//  Created by Daniel Rybak on 21/03/2021.
//

import SwiftUI

struct HomeViewSliderPanel: View {
    
    @Binding var currentSugarLevel: Double
    @Binding var targetSugarLevel: Double
    @Binding var carbsPerUnitOfInsulin: Double
    
    var colorScheme: ColorScheme
    
    var body: some View {
        VStack {
            NeumorphicSlider(color: colorScheme, range: 2.0...40.0, label: "Current", step: 0.1, unitsOfMeasure: "mmol", sliderValue: $currentSugarLevel)
                .padding(.top, 20)
            NeumorphicSlider(color: colorScheme, range: 4.5...10.0, label: "Target", step: 0.5, unitsOfMeasure: "mmol", sliderValue: $targetSugarLevel)
            NeumorphicSlider(color: colorScheme, range: 1.0...30.0, label: "Carbs / Unit", step: 1, unitsOfMeasure: "g", sliderValue: $carbsPerUnitOfInsulin)
        }
        .background(colorScheme == .dark ? Color.darkStart : Color.whiteEnd)
        .cornerRadius(15)
        .padding(.horizontal, 10)
        
    }
}

struct HomeViewSlider_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewSliderPanel(currentSugarLevel: .constant(5.5), targetSugarLevel: .constant(5.5), carbsPerUnitOfInsulin: .constant(5.0), colorScheme: .light)
    }
}
