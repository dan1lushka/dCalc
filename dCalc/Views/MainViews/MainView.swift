//
//  ContentView.swift
//  dCalc
//
//  Created by Daniel Rybak on 18/03/2021.
//

import SwiftUI

struct MainView: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    @ObservedObject var networkingManager: NetworkingManager
    @ObservedObject var calculationManager: CalculationManager
    @ObservedObject var viewTransitionManager: ViewTransitionManager
    @ObservedObject var popupViewManager: PopupViewManager
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                switch viewTransitionManager.currentView {
                case .home:
                  HomeView(calculationManager: calculationManager,
                           viewTransitionManager: viewTransitionManager,
                           networkingManager: networkingManager,
                           popupViewManager: popupViewManager)
                case .list:
                    ListView(calculationManager: calculationManager)
                case .popup:
                  PopupView(calculationManager: calculationManager,
                            viewTransitionManager: viewTransitionManager,
                            networkingManager: networkingManager,
                            popupViewManager: popupViewManager)
                }
                
                VStack {
                    Spacer()
                    CustomTabBar(viewTransitionManager: viewTransitionManager, spacing: geometry.size.width * 0.6)
                }
                .show(isVisible: $viewTransitionManager.showTabBar)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
          MainView(networkingManager: NetworkingManager(),
                   calculationManager: CalculationManager(),
                   viewTransitionManager: ViewTransitionManager(),
                   popupViewManager: PopupViewManager())
        }
    }
}
