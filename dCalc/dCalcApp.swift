//
//  dCalcApp.swift
//  dCalc
//
//  Created by Daniel Rybak on 18/03/2021.
//

import SwiftUI

@main
struct dCalcApp: App {
    
    @State var viewIndex = 0
    
    var body: some Scene {
        WindowGroup {
            MainView(selectedIndex: $viewIndex)
        }
    }
}
