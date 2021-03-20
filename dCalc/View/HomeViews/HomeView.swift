//
//  HomeView.swift
//  dCalc
//
//  Created by Daniel Rybak on 18/03/2021.
//

import SwiftUI

//TODO: Put this button in the middle and make it expandable
//ADD Calculate Button

struct HomeView: View {
    
    @State var currentSugarLevel: Double = 5.5
    @State var targetSugarLevel: Double = 5.5
    
    @State private var didLongPress = false
    
    var body: some View {
        GeometryReader { geometry in
            
            ZStack {
                
                LinearGradient(Color.darkStart, Color.darkEnd)
                
                VStack {
                    HomeViewSlider(range: 2.0...40.0, label: "Current", sliderValue: $currentSugarLevel)
                    HomeViewSlider(range: 4.5...10.0, label: "Target", sliderValue: $targetSugarLevel)
                }
                
                VStack {
                    Spacer()
                        .frame(height: geometry.size.height * 0.8)
                    
                    Button(action: {
                        let impact = UIImpactFeedbackGenerator(style: .heavy)
                        impact.impactOccurred()
                    }) {
                        Image(systemName: "plus")
                            .font(.system(size: 35, weight: .regular))
                            .foregroundColor(Color.blue)
                    }
                    .buttonStyle(HomeViewDarkButtonStyle())
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


