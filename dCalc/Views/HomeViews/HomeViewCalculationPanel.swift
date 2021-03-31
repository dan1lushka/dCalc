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

            HStack {
                HomeViewCalculateButton(colorScheme: colorScheme)
                
                Spacer()
                HomeViewCalculationLabel(dosage: $dosage, colorScheme: colorScheme)
               
            }
            .padding(.horizontal, 10)
    }
}

struct HomeViewCalculationTab_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeViewCalculationPanel(dosage: .constant(2), colorScheme: .light)
            HomeViewCalculationPanel(dosage: .constant(2), colorScheme: .dark)
        }
    }
}
