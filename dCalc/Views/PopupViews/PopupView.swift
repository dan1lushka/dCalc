//
//  HomeViewAddPopUp.swift
//  dCalc
//
//  Created by Daniel Rybak on 31/03/2021.
//

import SwiftUI

struct PopupView: View {
  
  @Environment(\.colorScheme) var colorScheme: ColorScheme
  
  @ObservedObject var calculationManager: CalculationManager
  @ObservedObject var viewTransitionManager: ViewTransitionManager
  @ObservedObject var networkingManager: NetworkingManager
  @ObservedObject var popupViewManager: PopupViewManager
  
  var body: some View {
    
    GeometryReader { geo in
      VStack {
        
        Spacer()
        
        ZStack {
          popupClearRectangle(size: geo.size.height * 0.2)
          errorText(message: nil)
        }
        
        ZStack {
          PopupViewBody(width: geo.size.width,
                        height: geo.size.height,
                        networkingManager: networkingManager,
                        calculationManager: calculationManager,
                        popupViewManager: popupViewManager
          )
          
          PopupAutoCompleteView(height: geo.size.height,
                                width: geo.size.width,
                                calculationManager: calculationManager,
                                popupViewManager: popupViewManager,
                                networkingManager: networkingManager,
                                isEditingProductName: $popupViewManager.isEditingProductName
          )
        }
        
        popupClearRectangle(size: geo.size.height * 0.15)
        
        HStack(spacing: geo.size.width / 2.5) {
          PopupSaveButtonView(calculationManager: calculationManager,
                              viewTransitionManager: viewTransitionManager,
                              popupViewManager: popupViewManager
          )
          
          PopupCancelButtonView(calculationManager: calculationManager,
                                viewTransitionManager: viewTransitionManager,
                                popupViewManager: popupViewManager
          )
        }
        .padding(.bottom, 50)
        
      }
      .font(.system(size: 15, weight: .bold))
      .foregroundColor(.cornBlue)
      .multilineTextAlignment(.center)
      .contentShape(Rectangle())
    }
    .adaptsToKeyboard()
  }
  
  func errorText(message: String?) -> some View {
    return Text("Error: \(popupViewManager.errorMessage)")
      .frame(height: 45)
      .lineLimit(2)
      .padding()
      .foregroundColor(.red)
      .show(isVisible: $popupViewManager.isError)
  }
  
  func popupClearRectangle(size: CGFloat) -> some View {
    return Rectangle()
      .frame(height: size)
      .background(Color.clear)
      .foregroundColor(.clear)
      .contentShape(Rectangle())
      .onTapGesture {
        hideKeyboard()
        popupViewManager.isEditingProductName = false
      }
  }
}

struct HomeViewAddPopUp_Previews: PreviewProvider {
  static var previews: some View {
    PopupView(calculationManager: CalculationManager(),
              viewTransitionManager: ViewTransitionManager(),
              networkingManager: NetworkingManager(),
              popupViewManager: PopupViewManager())
  }
}
