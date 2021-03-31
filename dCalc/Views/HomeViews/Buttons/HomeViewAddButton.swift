//
//  HomeViewAddButton.swift
//  dCalc
//
//  Created by Daniel Rybak on 21/03/2021.
//

import SwiftUI

struct HomeViewAddButton: View {
    
    @Binding var showButtons: Bool
    @Binding var showPopover: Bool
    
    var colorScheme: ColorScheme
    
    var body: some View {
        Button(action: {}) {
            Image(systemName: "plus")
                .font(.system(size: 35, weight: .regular))
                .foregroundColor(.cornBlue)
        }
        .contentShape(Circle())
        .buttonStyle(NeumorphicButtonStyle(paddingSize: 25, color: colorScheme == .light ? .light : .dark))
        .simultaneousGesture(LongPressGesture(minimumDuration: 0.3)
                                .onEnded { _ in
                                    let impact = UIImpactFeedbackGenerator(style: .heavy)
                                    impact.impactOccurred()
                                    
                                    showButtons = true
                                    
                                    print("long press Action!")
                                })
        .simultaneousGesture(TapGesture()
                                .onEnded {
                                    
                                    withAnimation {
                                        showPopover.toggle()
                                    }
                                    
                                    
                                    print("tap Action!")
                                })
    }
}

struct HomeViewAddButton_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewAddButton(showButtons: .constant(true), showPopover: .constant(false), colorScheme: .light)
    }
}
