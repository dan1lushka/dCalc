//
//  dCalcApp.swift
//  dCalc
//
//  Created by Daniel Rybak on 18/03/2021.
//

import SwiftUI

@main
struct dCalcApp: App {
    
    @StateObject var calculationManager = CalculationManager()
    @StateObject var viewTransitionManager = ViewTransitionManager()
    
    var body: some Scene {
        WindowGroup {
            MainView(calculationManager: calculationManager, viewTransitionManager: viewTransitionManager)
        }
        
    }
}
