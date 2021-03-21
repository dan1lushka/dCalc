//
//  HomeView.swift
//  dCalc
//
//  Created by Daniel Rybak on 18/03/2021.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    @State private var currentSugarLevel: Double = 5.5
    @State private var targetSugarLevel: Double = 5.5
    @State private var showButtons = false
    
    var body: some View {
        GeometryReader { geometry in
            //TODO: add Calculate Button
            ZStack {
                colorScheme == .light ? LinearGradient(.whiteStart, .whiteEnd) : LinearGradient(.darkStart, .darkEnd)
                
                VStack {
                    Spacer()
                        .frame(height: geometry.size.height * 0.45)
                    
                    HomeViewSlider(currentSugarLevel: $currentSugarLevel, targetSugarLevel: $targetSugarLevel, colorScheme: colorScheme)
                    
                    HomeViewExtraButtons(showButtons: $showButtons, colorScheme: colorScheme)
                    
                    HomeViewAddButton(showButtons: $showButtons, colorScheme: colorScheme)
                }
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
        HomeView()
    }
}
