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
    @StateObject var networkingManager = NetworkingManager()
    
    var body: some Scene {
        WindowGroup {
            MainView(networkingManager: networkingManager, calculationManager: calculationManager, viewTransitionManager: viewTransitionManager)
        }
        
    }
}
