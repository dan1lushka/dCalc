//
//  PopupSearchButtonView.swift
//  dCalc
//
//  Created by Daniel Rybak on 12/05/2021.
//

import SwiftUI

struct PopupSearchButtonView: View {
  
  @Environment(\.colorScheme) var colorScheme: ColorScheme
  
  @EnvironmentObject var networkingManager: NetworkingManager
  @EnvironmentObject var calculationManager: CalculationManager
  @EnvironmentObject var popupViewManager: PopupViewManager
  
  var body: some View {
    Button(action: {
      
      if !calculationManager.productName.isEmpty {
        
        popupViewManager.isLoading = true
        
        hideKeyboard()
        
        networkingManager.loadData(ingredient: calculationManager.productName, objectType: FoodInfoResponse.self) {
          
          if networkingManager.errorMessage.isEmpty {
            
            if let response = networkingManager.response as? FoodInfoResponse {
              
              if let gramsPer100gResponse = response.parsed.first?.food.nutrients.chocdf {
                popupViewManager.isError = false
                calculationManager.grammsPer100g = String(gramsPer100gResponse)
              } else {
                popupViewManager.isError = true
                popupViewManager.errorMessage = "No carbs data found for a given product"
              }
              
            }
          } else {
            popupViewManager.isError = true
            popupViewManager.errorMessage = networkingManager.errorMessage
            calculationManager.grammsPer100g = ""
          }
          
          popupViewManager.isLoading = false
        }
      } else {
        popupViewManager.isError = true
        popupViewManager.errorMessage = "Product name cannot be empty"
        calculationManager.grammsPer100g = ""
      }
      
    }, label: {
      Image(systemName: "magnifyingglass")
    })
      .buttonStyle(NeumorphicButtonStyle(paddingSize: 10))
      .padding(.bottom, 10)
      .offset(x: 0, y: 5)
  }
}

struct PopupSearchButtonView_Previews: PreviewProvider {
  static var previews: some View {
    PopupSearchButtonView()
      .environmentObject(NetworkingManager())
      .environmentObject(CalculationManager())
      .environmentObject(PopupViewManager())
  }
}
