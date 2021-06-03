//
//  HomeViewButtonStyle.swift
//  dCalc
//
//  Created by Daniel Rybak on 18/03/2021.
//

import SwiftUI

struct NeumorphicButtonStyle: ButtonStyle {
    var paddingSize: CGFloat
    var color: ColorScheme
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(paddingSize)
            .contentShape(Circle())
            .background(
                NeumorphicBackground(color: color, isHighlighted: configuration.isPressed, shape: Circle())
            )
    }
}
