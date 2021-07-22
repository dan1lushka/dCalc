//
//  NeumorphicBackground.swift
//  dCalc
//
//  Created by Daniel Rybak on 20/03/2021.
//

import SwiftUI

struct NeumorphicBackground<S: Shape>: View {
    
  @Environment(\.colorScheme) var colorScheme: ColorScheme
    var isHighlighted: Bool
    var shape: S
    
    var body: some View {
        ZStack {
            if isHighlighted {
                if colorScheme == .dark {
                    shape
                        .fill(Color.darkEnd)
                        .overlay(
                            shape
                                .fill(LinearGradient(Color.darkEnd, Color.darkStart))
                                .shadow(color: Color.darkStart, radius: 10, x: 5, y: 5)
                                .shadow(color: Color.darkEnd, radius: 10, x: -5, y: -5)
                        )
                        .overlay(
                            shape
                                .stroke(Color.darkEnd, lineWidth: 8)
                                .blur(radius: 4)
                                .offset(x: -2, y: -2)
                                .mask(shape.fill(LinearGradient(Color.whiteStart, Color.whiteEnd)))
                        )
                        
                } else {
                    shape
                        .fill(Color.whiteStart)
                        .overlay(
                            shape
                                .fill(LinearGradient(Color.whiteEnd, Color.whiteStart))
                                .shadow(color: Color.whiteStart, radius: 10, x: 5, y: 5)
                                .shadow(color: Color.whiteEnd, radius: 10, x: -5, y: -5)
                        )
                        .overlay(
                            shape
                                .stroke(Color.whiteEnd, lineWidth: 8)
                                .blur(radius: 4)
                                .offset(x: -2, y: -2)
                                .mask(shape.fill(LinearGradient(Color.darkStart, Color.darkEnd)))
                        )
                        
                }
            } else {
                if colorScheme == .dark {
                    shape
                        .fill(LinearGradient(Color.darkStart, Color.darkEnd))
                        .shadow(color: Color.darkStart, radius: 5, x: -3, y: -3)
                        .shadow(color: Color.darkEnd, radius: 5, x: 3, y: 3)
                } else {
                    shape
                        .fill(LinearGradient(Color.white, Color.whiteEnd))
                        .shadow(color: Color.whiteEnd, radius: 5, x: -3, y: -3)
                        .shadow(color: Color.whiteStart, radius: 5, x: 3, y: 3)
                }
            }
        }
        .animation(nil)
    }
}

struct NeumorphicBackground_Previews: PreviewProvider {
    static var previews: some View {
        NeumorphicBackground(isHighlighted: false, shape: Rectangle())
            .frame(width: 100, height: 100, alignment: .center)
    }
}
