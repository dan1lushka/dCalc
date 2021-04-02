//
//  ViewManager.swift
//  dCalc
//
//  Created by Daniel Rybak on 02/04/2021.
//

import SwiftUI

class ViewTransitionManager: ObservableObject {
    enum ViewState: Int {
        case home = 0
        case list = 1
        case popup = 2
    }

    @Published var currentView: ViewState = ViewState.home
    
    @Published var showHomeView = true
    @Published var showTabBar = true
    @Published var showPopup = false
    @Published var showExtraButtons = false
}
