//
//  HomeViewCalculationTab.swift
//  dCalc
//
//  Created by Daniel Rybak on 23/03/2021.
//

import SwiftUI

struct HomeViewCalculationPanel: View {

  var body: some View {
    
    HStack {
      HomeViewCalculateButton()
      
      Spacer()
      HomeViewCalculationLabel()
      
    }
    .padding(.horizontal, 10)
  }
}

struct HomeViewCalculationTab_Previews: PreviewProvider {
  static var previews: some View {
      HomeViewCalculationPanel()
  }
}
