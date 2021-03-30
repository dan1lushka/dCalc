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
                    .stroke(color == .dark ? Color.black : Color.gray, lineWidth: 4)
                    .blur(radius: 4)
                    .offset(x: 2, y: 2)
                    .mask(Rectangle()
                            .fill(LinearGradient(Color.black, Color.clear))
                            .cornerRadius(20)
                    )
            } else {
                if color == .dark {
                    shape
                        .fill(Color.darkEnd)
                        .shadow(color: Color.black, radius: 5, x: -5, y: -5)
                } else {
                    shape
                        .fill(Color.whiteStart)
                        .shadow(color: Color.white, radius: 5, x: -5, y: -5)
                        .shadow(color: Color.white, radius: 5, x: 5, y: 5)
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
