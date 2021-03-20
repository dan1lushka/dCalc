//
//  HomeViewSlider.swift
//  dCalc
//
//  Created by Daniel Rybak on 19/03/2021.
//

import SwiftUI

//TODO: Add depth effects
struct HomeViewSlider: View {
    
    let okRange = 4.0 ..< 11.0
    var range: ClosedRange<Double>
    var label: String
    
    @Binding var sliderValue: Double
    
    var body: some View {
        ZStack {
            Text("\(label): \(String(format: "%.1f", sliderValue)) mmol")
                .foregroundColor(okRange ~= sliderValue ? .blue : .red)
                .font(.system(size: 15, weight: .bold))
                .padding(.bottom, 55)
            
            Slider(value: $sliderValue, in: range, step: 0.1)
                .padding(30)
                .accentColor(Color.blue)
                .overlay(
                    RoundedRectangle(cornerRadius: 15.0)
                        .stroke(lineWidth: 2.0)
                        .foregroundColor(Color.blue)
                )
                .padding(.horizontal, 10)
        }
    }
}

struct HomeViewSlider_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewSlider(range: 2.0 ... 40.0, label: "Sugar Level", sliderValue: .constant(5.0))
    }
}
