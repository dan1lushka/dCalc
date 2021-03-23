//
//  HomeViewDosageLabel.swift
//  dCalc
//
//  Created by Daniel Rybak on 23/03/2021.
//

import SwiftUI

struct HomeViewDosageLabel: View {
    
    @Binding var dosage: Int
    
    var colorScheme: ColorScheme
    
    var body: some View {
        VStack {
            ZStack {
                NeumorphicBackground(color: colorScheme, isHighlighted: false, shape: Rectangle())
                    .frame(width: 150, height: 55, alignment: .center)
                    .cornerRadius(25)
                VStack {
                    Text("\(dosage > 0 ? String(dosage) : "0") \(dosage > 1 ? "units" : "unit")")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.cornBlue)
                }
            }
            .padding(.horizontal, 10)
        }
    }
}

struct HomeViewDosageLabel_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewDosageLabel(dosage: .constant(2), colorScheme: .light)
    }
}
