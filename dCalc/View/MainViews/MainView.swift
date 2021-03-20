//
//  ContentView.swift
//  dCalc
//
//  Created by Daniel Rybak on 18/03/2021.
//

import SwiftUI


//TODO: add logic to jump between views
struct MainView: View {
    
    @State var selectedIndex = 0
    
   
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack {
                    switch selectedIndex {
                    case 0:
                        NavigationView {
                            HomeView()
                        }
                        
                    default:
                        NavigationView {
                            ListView()
                        }
                    }
                    
                    VStack {
                        Spacer()
                        CustomTabBar(selectedIndex: $selectedIndex, spacing: geometry.size.width * 0.5)
                    }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}



