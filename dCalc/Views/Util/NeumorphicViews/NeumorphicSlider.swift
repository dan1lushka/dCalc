//
//  HomeViewSlider.swift
//  dCalc
//
//  Created by Daniel Rybak on 19/03/2021.
//

import SwiftUI

struct NeumorphicSlider: View {

    let okRange = 4.0 ..< 11.0
    var range: ClosedRange<Double>
    var label: String
    var step: Double
    var unitsOfMeasure: String
    
    @Binding var sliderValue: Double
    
    var body: some View {
        ZStack {
            Slider(value: $sliderValue, in: range, step: step)
                .accentColor(.cornBlue)
            
            Text("\(label): \(String(format: "%.1f", sliderValue)) \(unitsOfMeasure)")
                .foregroundColor(unitsOfMeasure != "mmol" ? .cornBlue : okRange ~= sliderValue ? .cornBlue : .red)
                .font(.system(size: 15, weight: .bold))
                .offset(x: 0, y: -30)
        }
        .padding()
    }
}

struct NeumorphicSlider_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            LinearGradient( .whiteStart, .whiteEnd)
            NeumorphicSlider(range: 2.0 ... 40.0,
                             label: "Sugar Level",
                             step: 0.1,
                             unitsOfMeasure: "mmol",
                             sliderValue: .constant(10.0))
        }
    }
}
