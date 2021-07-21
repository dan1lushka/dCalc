//
//  HomeViewCalculationLabel.swift
//  dCalc
//
//  Created by Daniel Rybak on 30/03/2021.
//

import SwiftUI

struct HomeViewCalculationLabel: View {
    
    @EnvironmentObject var calculationManager: CalculationManager
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
      Text("\(String(calculationManager.dosage)) \(calculationManager.dosage == 1 ? "unit" : "units")")
            .padding()
            .font(.system(size: 15, weight: .bold))
            .foregroundColor(.cornBlue)
            .frame(width: 200)
            .background(colorScheme == .dark ? Color.darkStart : Color.whiteEnd)
            .cornerRadius(15)
    }
}

struct HomeViewCalculationLabel_Previews: PreviewProvider {
    static var previews: some View {
      HomeViewCalculationLabel()
        .environmentObject(CalculationManager())
    }
}
