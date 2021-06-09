//
//  PopupSaveButtonView.swift
//  dCalc
//
//  Created by Daniel Rybak on 11/05/2021.
//

import SwiftUI

struct PopupSaveButtonView: View {
  
  @ObservedObject var calculationManager: CalculationManager
  @ObservedObject var viewTransitionManager: ViewTransitionManager
  @ObservedObject var popupViewManager: PopupViewManager
  
  @Environment(\.colorScheme) var colorScheme: ColorScheme
  
  var body: some View {
    
    Button {
      popupViewManager.asignProductNameValid(isInvalid: calculationManager.productName.isEmptyOrZero)
      popupViewManager.asignGrammsConsumedInvalid(isInvalid: calculationManager.grammsConsumed.isEmptyOrZero)
      popupViewManager.asignGrammsPer100gInvalid(isInvalid: calculationManager.grammsPer100g.isEmptyOrZero)
      
      popupViewManager.errorMessage = "\(popupViewManager.isProductNameInvalid ? "Product name field is invalid. " : "")" +
      "\(popupViewManager.isGrammsConsumedInvalid ? "Gramms consumed field is invalid. " : "")" +
      "\(popupViewManager.isGrammsPer100gInvalid ? "Gramms of carbs per 100g of product field is invalid" : "")"
      
      popupViewManager.asignAllFieldsInvalid()
      
      if popupViewManager.isAllFieldsValid {
        calculationManager.consumedFoodItems.items.append(
          ConsumedFood.Item(
            productName: calculationManager.productName,
            grammsConsumed: Double(calculationManager.grammsConsumed)!.round(to: 1),
            grammsPer100g: Double(calculationManager.grammsPer100g)!.round(to: 1)
          )
        )
        popupViewManager.isError = false
        calculationManager.dosage = calculationManager.getDosage()
        viewTransitionManager.closePopup()
      } else {
        popupViewManager.isError = true
      }
    } label: {
      Text("Save")
    }
    .buttonStyle(NeumorphicButtonStyle(paddingSize: 30))
  }
}

struct PopupSaveButtonView_Previews: PreviewProvider {
  static var previews: some View {
    PopupCancelButtonView(calculationManager: CalculationManager(),
                          viewTransitionManager: ViewTransitionManager(),
                          popupViewManager: PopupViewManager()
    )
  }
}
