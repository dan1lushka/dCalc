//
//  ContentView.swift
//  dCalc
//
//  Created by Daniel Rybak on 18/03/2021.
//

import SwiftUI

struct MainView: View {
    
    @Binding var selectedIndex: Int
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                switch selectedIndex {
                case 0:
                    HomeView(colorScheme: colorScheme)
                default:
                    ListView(colorScheme: colorScheme)
                }
                
                VStack {
                    Spacer()
                    CustomTabBar(selectedIndex: $selectedIndex, spacing: geometry.size.width * 0.6)
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView(selectedIndex: .constant(0))
            MainView(selectedIndex: .constant(1))
        }
        
    }
}



