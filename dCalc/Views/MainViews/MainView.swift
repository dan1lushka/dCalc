//
//  ContentView.swift
//  dCalc
//
//  Created by Daniel Rybak on 18/03/2021.
//

import SwiftUI

struct MainView: View {
  
  @Environment(\.colorScheme) var colorScheme: ColorScheme
  
  @EnvironmentObject var calculationManager: CalculationManager
  @EnvironmentObject var viewTransitionManager: ViewTransitionManager
  @EnvironmentObject var networkingManager: NetworkingManager
  @EnvironmentObject var popupViewManager: PopupViewManager
  
  var body: some View {
    
    GeometryReader { geometry in
      
      ZStack {
        switch viewTransitionManager.currentView {
        case .home:
          HomeView()
        case .list:
          ListView()
        case .popup:
          PopupView()
        }
        
        VStack {
          Spacer()
          CustomTabBar(spacing: geometry.size.width * 0.6)
        }
        .show(isVisible: $viewTransitionManager.showTabBar)
      }
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      MainView()
        .environmentObject(CalculationManager())
        .environmentObject(ViewTransitionManager())
        .environmentObject(NetworkingManager())
        .environmentObject(PopupViewManager())
    }
  }
}
