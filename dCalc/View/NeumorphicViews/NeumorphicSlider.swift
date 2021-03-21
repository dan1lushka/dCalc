//
//  HomeViewSlider.swift
//  dCalc
//
//  Created by Daniel Rybak on 19/03/2021.
//

import SwiftUI

//TODO: add depth effect to slider like for button
struct NeumorphicSlider: View {
    
    let okRange = 4.0 ..< 11.0
    var color: ColorScheme
    var range: ClosedRange<Double>
    var label: String
    
    @Binding var sliderValue: Double
    
    var body: some View {
        ZStack {
            Slider(value: $sliderValue, in: range, step: 0.1)
                .frame(height: 100)
                .accentColor(Color.blue)
                .background(NeumorphicBackground(color: color, isHighlighted: false, shape: Rectangle()))
                .cornerRadius(20)
                .padding(.horizontal, 10)
            
            Text("\(label): \(String(format: "%.1f", sliderValue)) mmol")
                .foregroundColor(okRange ~= sliderValue ? .blue : .red)
                .font(.system(size: 15, weight: .bold))
                .padding(.bottom, 55)
        }
    }
}

struct NeumorphicSlider_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            LinearGradient( .whiteStart, .whiteEnd)
            NeumorphicSlider(color: ColorScheme.light, range: 2.0 ... 40.0, label: "Sugar Level", sliderValue: .constant(10.0))
        }
    }
}
