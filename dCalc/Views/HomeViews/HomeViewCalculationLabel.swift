//
//  HomeViewCalculationLabel.swift
//  dCalc
//
//  Created by Daniel Rybak on 30/03/2021.
//

import SwiftUI

struct HomeViewCalculationLabel: View {
    
    @Binding var dosage: Int
    
    var colorScheme: ColorScheme
    
    var body: some View {
        Text("\(dosage > 0 ? String(dosage) : "0") \(dosage > 1 ? "units" : "unit")")
            .padding()
            .font(.system(size: 15, weight: .bold))
            .foregroundColor(.cornBlue)
            .frame(width: 200)
            .background(
                NeumorphicBackground(color: colorScheme, isHighlighted: false, shape: Rectangle())
            )
    }
}

struct HomeViewCalculationLabel_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewCalculationLabel(dosage: .constant(2), colorScheme: .dark)
    }
}
