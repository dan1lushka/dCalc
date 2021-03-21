//
//  HomeView.swift
//  dCalc
//
//  Created by Daniel Rybak on 18/03/2021.
//

import SwiftUI

struct HomeView: View {
    
    let buttonImages = ["highlighter", "barcode", "camera"]
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    @State private var currentSugarLevel: Double = 5.5
    @State private var targetSugarLevel: Double = 5.5
    @State private var showButtons = false
    
    var body: some View {
        GeometryReader { geometry in
            //TODO: add Calculate Button
            ZStack {
                colorScheme == .light ? LinearGradient(.whiteStart, .whiteEnd) : LinearGradient(.darkStart, .darkEnd)
                
                VStack(spacing: 10) {
                    NeumorphicSlider(color: colorScheme, range: 2.0...40.0, label: "Current", sliderValue: $currentSugarLevel)
                    NeumorphicSlider(color: colorScheme, range: 4.5...10.0, label: "Target", sliderValue: $targetSugarLevel)
                }
                
                Spacer()
                
                VStack {
                    Spacer()
                        .frame(height: geometry.size.height * 0.7)
                    
                    VStack {
                        HStack {
                            ForEach(0 ..< 3) { num in
                                Button(action: {
                                    //TODO: add action
                                }) {
                                    Image(systemName: buttonImages[num])
                                        .font(.system(size: 25, weight: .regular))
                                        .foregroundColor(.blue)
                                }
                                .buttonStyle(NeumorphicButtonStyle(paddingSize: 15, color: (colorScheme == .light ? .light : .dark)))
                                .padding()
                                .show(isVisible: $showButtons)
                            }
                        }
                    }
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "plus")
                            .font(.system(size: 35, weight: .regular))
                            .foregroundColor(.blue)
                    }
                    .buttonStyle(NeumorphicButtonStyle(paddingSize: 25, color: colorScheme == .light ? .light : .dark))
                    .simultaneousGesture(LongPressGesture(minimumDuration: 0.3).onEnded { _ in
                        let impact = UIImpactFeedbackGenerator(style: .heavy)
                        impact.impactOccurred()
                        
                        withAnimation {
                            showButtons = true
                        }
                        
                        print("long press Action!")
                    })
                    .simultaneousGesture(TapGesture().onEnded {
                        print("tap Action!")
                    })
                    
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
