//
//  HomeViewCalculationTab.swift
//  dCalc
//
//  Created by Daniel Rybak on 23/03/2021.
//

import SwiftUI

struct HomeViewCalculationPanel: View {
    
    @Binding var dosage: Int
    
    var colorScheme: ColorScheme
    
    var body: some View {
        ZStack {
            NeumorphicBackground(color: colorScheme, isHighlighted: false, shape: Rectangle())
                .cornerRadius(20)
                .padding(.horizontal, 10)
                .frame(height: 100)
            HStack {
                HomeViewCalculateButton(colorScheme: colorScheme)
                
                Spacer()
                
                HomeViewDosageLabel(dosage: $dosage, colorScheme: colorScheme)
            }
        }
    }
}

struct HomeViewCalculationTab_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewCalculationPanel(dosage: .constant(2), colorScheme: .light)
    }
}
