//
//  HomeView.swift
//  dCalc
//
//  Created by Daniel Rybak on 18/03/2021.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    @ObservedObject var calculationManager: CalculationManager
    @ObservedObject var viewTransitionManager: ViewTransitionManager
    @ObservedObject var networkingManager: NetworkingManager
    @ObservedObject var popupViewManager: PopupViewManager
    
    var body: some View {
        GeometryReader { geometry in
            // todo: check .background on zstack
            // todo: check .aspectration instad of using geomtryReader for making things take up a certain size of a view
            ZStack {
                
                VStack {
                    ViewHeader(width: geometry.size.width * 0.95, text: "Home")
                    
                    HomeViewCalculationPanel(calculationManager: calculationManager, viewTransitionManager: viewTransitionManager)
                    
                    Spacer()
                        .frame(height: geometry.size.height * 0.1)

                    HomeViewSliderPanel(calculationManager: calculationManager, viewTransitionManager: viewTransitionManager)
                    
                    Spacer()
                    
                    HomeViewExtraButtons(viewTransitionManager: viewTransitionManager)
                    
                    Spacer()
                    
                    HomeViewAddButton(viewTransitionManager: viewTransitionManager)
                    
                    Spacer()
                        .frame(height: geometry.size.height * 0.025)
                }
                .show(isVisible: $viewTransitionManager.showHomeView)
                
              PopupView(calculationManager: calculationManager,
                        viewTransitionManager: viewTransitionManager,
                        networkingManager: networkingManager,
                        popupViewManager: popupViewManager)
                    .show(isVisible: $viewTransitionManager.showPopup)
            }
            .background(colorScheme == .light ? Color.whiteStart : Color.darkEnd)
        }
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            viewTransitionManager.showExtraButtons = false
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
      HomeView(calculationManager: CalculationManager(),
               viewTransitionManager: ViewTransitionManager(),
               networkingManager: NetworkingManager(),
               popupViewManager: PopupViewManager())
    }
}
