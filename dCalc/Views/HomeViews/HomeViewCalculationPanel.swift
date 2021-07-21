//
//  HomeViewCalculationTab.swift
//  dCalc
//
//  Created by Daniel Rybak on 23/03/2021.
//

import SwiftUI

struct HomeViewCalculationPanel: View {
  
  @Environment(\.colorScheme) var colorScheme: ColorScheme
  
  @EnvironmentObject var calculationManager: CalculationManager
  @EnvironmentObject var viewTransitionManager: ViewTransitionManager
  
  var body: some View {
    
    HStack {
      HomeViewCalculateButton()
      
      Spacer()
      HomeViewCalculationLabel(dosage: $calculationManager.dosage)
      
    }
    .padding(.horizontal, 10)
  }
}

struct HomeViewCalculationTab_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      HomeViewCalculationPanel()
        .environmentObject(CalculationManager())
        .environmentObject(ViewTransitionManager())
    }
  }
}
