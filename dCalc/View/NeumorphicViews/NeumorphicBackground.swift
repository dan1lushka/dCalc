//
//  NeumorphicBackground.swift
//  dCalc
//
//  Created by Daniel Rybak on 20/03/2021.
//

import SwiftUI

struct NeumorphicBackground<S: Shape>: View {
    
    var color: ColorScheme
    var isHighlighted: Bool
    var shape: S
    
    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(color == .dark ? LinearGradient(Color.darkEnd, Color.darkStart) : LinearGradient(Color.whiteEnd, Color.whiteStart))
                    .overlay(shape.stroke(color == .dark ? LinearGradient(Color.darkStart, Color.darkEnd) : LinearGradient(Color.whiteStart, Color.whiteEnd), lineWidth: 2))
                    .shadow(color: color == .dark ? Color.darkStart : Color.whiteStart, radius: 5, x: 5, y: 5)
                    .shadow(color: color == .dark ? Color.darkEnd : Color.whiteEnd, radius: 5, x: -5, y: -5)
                
            } else {
                shape
                    .fill(color == .dark ? LinearGradient(Color.darkStart, Color.darkEnd) : LinearGradient(Color.whiteStart, Color.whiteEnd))
                    .shadow(color: color == .dark ? Color.darkStart : Color.whiteStart, radius: 5, x: -5, y: -5)
                    .shadow(color: color == .dark ? Color.darkEnd : Color.whiteEnd, radius: 5, x: 5, y: 5)
            }
        }
        .animation(nil)
    }
}

struct NeumorphicBackground_Previews: PreviewProvider {
    static var previews: some View {
        NeumorphicBackground(color: ColorScheme.light, isHighlighted: false, shape: Circle())
    }
}
