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
    @State private var carbsPerUnitOfInsuline: Double = 10.0
    @State private var showButtons = false
    
    var body: some View {
        GeometryReader { geometry in
            //TODO: add Calculate Button
            ZStack {
                colorScheme == .light ? LinearGradient(.whiteStart, .whiteEnd) : LinearGradient(.darkStart, .darkEnd)
                
                VStack {
                    ZStack {
                        
                        //TODO: finish top view with calculate button and insuline dosage label
                        NeumorphicBackground(color: colorScheme, isHighlighted: false, shape: Rectangle())
                            .cornerRadius(20)
                            .padding(.horizontal, 10)
                            .frame(height: 100)
                        HStack {
                            Button(action: {
                                
                            }) {
                                Image(systemName: "equal")
                                    .font(.system(size: 35, weight: .regular))
                                    .foregroundColor(.blue)
                            }
                            .buttonStyle(NeumorphicButtonStyle(paddingSize: 25, color: colorScheme == .light ? .light : .dark))
                            .padding()
                            NeumorphicBackground(color: colorScheme, isHighlighted: false, shape: Circle())
                                .frame(height: 80)
                        }
                    }
                    HomeViewSlider(currentSugarLevel: $currentSugarLevel, targetSugarLevel: $targetSugarLevel, carbsPerUnitOfInsuline: $carbsPerUnitOfInsuline, colorScheme: colorScheme)
                    
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
