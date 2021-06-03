//
//  HomeViewAddButton.swift
//  dCalc
//
//  Created by Daniel Rybak on 21/03/2021.
//

import SwiftUI

struct HomeViewAddButton: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    @ObservedObject var viewTransitionManager: ViewTransitionManager

    var body: some View {
      Button {
        
      } label: {
            Image(systemName: "plus")
                .font(.system(size: 35, weight: .regular))
                .foregroundColor(.cornBlue)
        }
        .contentShape(Circle())
        .buttonStyle(NeumorphicButtonStyle(paddingSize: 25, color: colorScheme == .light ? .light : .dark))
        // fixme: simultaneousGesture activates TapGesture when LongPressGesture is executed
        .simultaneousGesture(LongPressGesture(minimumDuration: 0.5)
                                .onEnded { _ in
                                    let impact = UIImpactFeedbackGenerator(style: .heavy)
                                    impact.impactOccurred()
                                    
                                    viewTransitionManager.showExtraButtons = true
                                    
                                    print("long press Action!")
                                })
        .simultaneousGesture(TapGesture()
                                .onEnded {
                                    viewTransitionManager.showPopup = true
                                    viewTransitionManager.showHomeView = false
                                    viewTransitionManager.showTabBar = false
                                    
                                    print("tap Action!")
                                })
    }
}

struct HomeViewAddButton_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewAddButton(viewTransitionManager: ViewTransitionManager())
    }
}
