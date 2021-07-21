//
//  CustomTabBar.swift
//  dCalc
//
//  Created by Daniel Rybak on 19/03/2021.
//

import SwiftUI

struct CustomTabBar: View {
  
  @Environment(\.colorScheme) var colorScheme: ColorScheme
  
  @EnvironmentObject var viewTransitionManager: ViewTransitionManager
  
  let tabBarImages = ["house", "list.dash"]
  var spacing: CGFloat
  
  var body: some View {
    HStack(spacing: spacing) {
      ForEach(0 ..< 2) { num in
        Button {
          viewTransitionManager.currentView = ViewTransitionManager.ViewState(rawValue: num)!
        } label: {
          Image(systemName: tabBarImages[num])
            .font(.system(size: 24, weight: .bold))
            .foregroundColor(viewTransitionManager.currentView.rawValue == num ?
                             (colorScheme == .light ? .black: .white) :
                                .cornBlue)
        }
        .buttonStyle(NeumorphicButtonStyle(paddingSize: 12))
      }
    }
  }
}

struct CustomTabBar_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      VStack {
        Spacer()
        CustomTabBar(spacing: 100)
          .environmentObject(ViewTransitionManager())
      }
      
      VStack {
        Spacer()
        CustomTabBar(spacing: 100)
          .environmentObject(ViewTransitionManager())
      }
    }
  }
}
