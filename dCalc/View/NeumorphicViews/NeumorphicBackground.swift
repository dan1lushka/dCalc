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
                if color == .dark {
                    shape
                        .fill(LinearGradient(Color.darkEnd, Color.darkStart))
                        .overlay(shape.stroke(LinearGradient(Color.darkStart, Color.darkEnd), lineWidth: 2))
                        .shadow(color: Color.darkStart, radius: 5, x: 5, y: 5)
                        .shadow(color: Color.darkEnd, radius: 5, x: -5, y: -5)
                } else {
                    shape
                        .fill(LinearGradient(Color.whiteEnd, Color.whiteStart))
                        .overlay(shape.stroke(LinearGradient(Color.whiteStart, Color.whiteEnd), lineWidth: 2))
                        .shadow(color: Color.whiteStart, radius: 5, x: 5, y: 5)
                        .shadow(color: Color.whiteEnd, radius: 5, x: -5, y: -5)
                }
            } else {
                if color == .dark {
                    shape
                        .fill(LinearGradient(Color.darkStart, Color.darkEnd))
                        .shadow(color: Color.darkStart, radius: 5, x: -5, y: -5)
                        .shadow(color: Color.darkEnd, radius: 5, x: 5, y: 5)
                } else {
                    shape
                        .fill(LinearGradient(Color.whiteStart, Color.whiteEnd))
                        .shadow(color: Color.whiteStart, radius: 5, x: -5, y: -5)
                        .shadow(color: Color.whiteEnd, radius: 5, x: 5, y: 5)
                }
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
