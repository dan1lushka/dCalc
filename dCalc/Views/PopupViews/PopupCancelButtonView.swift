//
//  PopupCancelButtonView.swift
//  dCalc
//
//  Created by Daniel Rybak on 11/05/2021.
//

import SwiftUI

struct PopupCancelButtonView: View {
  
  @EnvironmentObject var calculationManager: CalculationManager
  @EnvironmentObject var viewTransitionManager: ViewTransitionManager
  @EnvironmentObject var popupViewManager: PopupViewManager
  
  @Environment(\.colorScheme) var colorScheme: ColorScheme
  
  var body: some View {
    
    Button {
      popupViewManager.isError = false
      viewTransitionManager.closePopup()
    } label: {
      Text("Cancel")
    }
    .buttonStyle(NeumorphicButtonStyle(paddingSize: 30))
  }
}

struct PopupCancelButtonView_Previews: PreviewProvider {
  static var previews: some View {
    PopupCancelButtonView()
      .environmentObject(CalculationManager())
      .environmentObject(ViewTransitionManager())
      .environmentObject(PopupViewManager())
  }
}
