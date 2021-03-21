//
//  HomeViewSlider.swift
//  dCalc
//
//  Created by Daniel Rybak on 21/03/2021.
//

import SwiftUI

struct HomeViewSlider: View {
    
    @Binding var currentSugarLevel: Double
    @Binding var targetSugarLevel: Double
    
    var colorScheme: ColorScheme
    
    var body: some View {
        VStack(spacing: 10) {
            NeumorphicSlider(color: colorScheme, range: 2.0...40.0, label: "Current", sliderValue: $currentSugarLevel)
            NeumorphicSlider(color: colorScheme, range: 4.5...10.0, label: "Target", sliderValue: $targetSugarLevel)
        }
    }
}

struct HomeViewSlider_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewSlider(currentSugarLevel: .constant(5.5), targetSugarLevel: .constant(5.5), colorScheme: .light)
    }
}
