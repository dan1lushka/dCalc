//
//  HomeViewExtraButtons.swift
//  dCalc
//
//  Created by Daniel Rybak on 21/03/2021.
//

import SwiftUI

struct HomeViewExtraButtons: View {
  
  @Environment(\.colorScheme) var colorScheme: ColorScheme
  
  @EnvironmentObject var viewTransitionManager: ViewTransitionManager
  
  let buttonImages = ["highlighter", "barcode", "camera"]
  
  var body: some View {
    VStack {
      HStack {
        ForEach(0 ..< 3) { num in
          Button {
            // todo: add action
          } label: {
            Image(systemName: buttonImages[num])
              .font(.system(size: 25, weight: .regular))
              .foregroundColor(.cornBlue)
          }
          .buttonStyle(NeumorphicButtonStyle(paddingSize: 15))
          .padding()
          .show(isVisible: $viewTransitionManager.showExtraButtons)
        }
      }
    }
  }
}

struct HomeViewExtraButtons_Previews: PreviewProvider {
  static var previews: some View {
    HomeViewExtraButtons()
      .environmentObject(ViewTransitionManager())
  }
}
