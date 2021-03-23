//
//  CustomTabBar.swift
//  dCalc
//
//  Created by Daniel Rybak on 19/03/2021.
//

import SwiftUI

struct CustomTabBar: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    @Binding var selectedIndex: Int
    
    let tabBarImages = ["house", "list.dash"]
    var spacing: CGFloat
    
    var body: some View {
        HStack(spacing: spacing) {
            ForEach(0 ..< 2) { num in
                Button(action: {
                    selectedIndex = num
                }) {
                    Image(systemName: tabBarImages[num])
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(selectedIndex == num ?
                                            (colorScheme == .light ? .black: .white) :
                                            .cornBlue)
                }
                .buttonStyle(NeumorphicButtonStyle(paddingSize: 12, color: colorScheme == .light ? .light : .dark))
            }
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            VStack {
                Spacer()
                CustomTabBar(selectedIndex: .constant(1), spacing: 100)
            }
            
            VStack {
                Spacer()
                CustomTabBar(selectedIndex: .constant(0), spacing: 100)
            }
        }
    }
}
