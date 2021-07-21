//
//  ContentView.swift
//  dCalc
//
//  Created by Daniel Rybak on 18/03/2021.
//

import SwiftUI

struct MainView: View {

  @EnvironmentObject var viewTransitionManager: ViewTransitionManager

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
        .environmentObject(ViewTransitionManager())
    }
  }
}
