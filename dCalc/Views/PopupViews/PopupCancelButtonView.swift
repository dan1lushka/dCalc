//
//  PopupCancelButtonView.swift
//  dCalc
//
//  Created by Daniel Rybak on 11/05/2021.
//

import SwiftUI

struct PopupCancelButtonView: View {
  
  @ObservedObject var calculationManager: CalculationManager
  @ObservedObject var viewTransitionManager: ViewTransitionManager
  @ObservedObject var popupViewManager: PopupViewManager
  
  var colorScheme: ColorScheme
  
  var body: some View {
    
    Button {
      popupViewManager.isError = false
      viewTransitionManager.closePopup()
    } label: {
      Text("Cancel")
    }
    .buttonStyle(NeumorphicButtonStyle(paddingSize: 30, color: colorScheme))
  }
}

struct PopupCancelButtonView_Previews: PreviewProvider {
  static var previews: some View {
    PopupCancelButtonView(calculationManager: CalculationManager(),
                          viewTransitionManager: ViewTransitionManager(),
                          popupViewManager: PopupViewManager(),
                          colorScheme: .light)
  }
}
