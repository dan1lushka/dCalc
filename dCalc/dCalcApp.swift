//
//  dCalcApp.swift
//  dCalc
//
//  Created by Daniel Rybak on 18/03/2021.
//

import SwiftUI

@main
struct DCalcApp: App {

  var body: some Scene {
    WindowGroup {
      MainView()
        .environmentObject(CalculationManager())
        .environmentObject(ViewTransitionManager())
        .environmentObject(NetworkingManager())
        .environmentObject(PopupViewManager())
    }
  }
}
