//
//  HomeViewCalculateButton.swift
//  dCalc
//
//  Created by Daniel Rybak on 23/03/2021.
//

import SwiftUI

struct HomeViewCalculateButton: View {
  @Environment(\.colorScheme) var colorScheme: ColorScheme
  
  var body: some View {
    Button {
      print("Calculate button tapped action ")
    } label: {
      Image(systemName: "equal")
        .font(.system(size: 35, weight: .regular))
        .foregroundColor(.cornBlue)
    }
    .buttonStyle(NeumorphicButtonStyle(paddingSize: 25))
    .padding()
    
  }
}

struct HomeViewCalculateButton_Previews: PreviewProvider {
  static var previews: some View {
    HomeViewCalculateButton()
  }
}
