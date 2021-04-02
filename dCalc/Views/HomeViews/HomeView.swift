//
//  HomeView.swift
//  dCalc
//
//  Created by Daniel Rybak on 18/03/2021.
//

import SwiftUI

struct HomeView: View {
    var colorScheme: ColorScheme
    
    @Binding var showHomeView: Bool
    @Binding var showTabBar: Bool
    
    @State private var currentSugarLevel: Double = 5.5
    @State private var targetSugarLevel: Double = 5.5
    @State private var carbsPerUnitOfInsuline: Double = 10.0
    @State private var showButtons = false
    @State private var dosage = 2
    @State private var showManualAddPopover = false
    @State private var productName = ""
    @State private var grammsConsumed = ""
    @State private var grammsPer100g = ""
    
    var body: some View {
        GeometryReader { geometry in
            
            ZStack {
                
                colorScheme == .light ? Color.whiteStart : Color.darkEnd
                
                VStack {
                    ViewHeader(width: geometry.size.width * 0.95, text: "Home")
                    
                    HomeViewCalculationPanel(dosage: $dosage, colorScheme: colorScheme)
                    
                    Spacer()
                        .frame(height: geometry.size.height * 0.1)
                    
                    HomeViewSliderPanel(currentSugarLevel: $currentSugarLevel, targetSugarLevel: $targetSugarLevel, carbsPerUnitOfInsulin: $carbsPerUnitOfInsuline, colorScheme: colorScheme)
                    
                    Spacer()
                    
                    HomeViewExtraButtons(showButtons: $showButtons, colorScheme: colorScheme)
                    
                    Spacer()
                    
                    HomeViewAddButton(showButtons: $showButtons, showPopover: $showManualAddPopover, showHomeView: $showHomeView, showTabBar: $showTabBar, colorScheme: colorScheme)
                    
                    Spacer()
                        .frame(height: geometry.size.height * 0.025)
                }
                .show(isVisible: $showHomeView)
                
                PopupView(colorScheme: colorScheme, productName: $productName, grammsConsumed: $grammsConsumed, grammsPer100g: $grammsPer100g, showPopup: $showManualAddPopover, showHomeView: $showHomeView, showTabBar: $showTabBar)
                    .show(isVisible: $showManualAddPopover)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            showButtons = false
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(colorScheme: .light, showHomeView: .constant(false), showTabBar: .constant(true))
    }
}
