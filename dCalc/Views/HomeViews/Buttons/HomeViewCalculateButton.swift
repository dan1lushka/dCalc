//
//  HomeViewCalculateButton.swift
//  dCalc
//
//  Created by Daniel Rybak on 23/03/2021.
//

import SwiftUI

struct HomeViewCalculateButton: View {
    var colorScheme: ColorScheme
    
    var body: some View {
        Button(action: {
            print("Calculate button tapped action ")
        }) {
            Image(systemName: "equal")
                .font(.system(size: 35, weight: .regular))
                .foregroundColor(.cornBlue)
        }
        .buttonStyle(NeumorphicButtonStyle(paddingSize: 25, color: colorScheme == .light ? .light : .dark))
        .padding()
        
    }
}

struct HomeViewCalculateButton_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewCalculateButton(colorScheme: .light)
    }
}
