//
//  PopupViewModel.swift
//  dCalc
//
//  Created by Daniel Rybak on 11/05/2021.
//

import SwiftUI

class PopupViewManager: ObservableObject {
  @Published var isProductNameInvalid = true
  @Published var isGrammsConsumedInvalid = true
  @Published var isGrammsPer100gInvalid = true
  @Published var isAllFieldsValid = false
  @Published var isError = false
  @Published var errorMessage = ""
  @Published var isEditingProductName = false
  @Published var isLoading = false
  
  @Published var autoCompleteList = [String]() as Codable
  
  func asignProductNameValid(isInvalid: Bool) {
    if isInvalid {
      isProductNameInvalid = true
    } else {
      isProductNameInvalid = false
    }
  }
  
  func asignGrammsConsumedInvalid(isValid: Bool) {
    if isValid {
      isGrammsConsumedInvalid = true
    } else {
      isGrammsConsumedInvalid = false
    }
  }
  
  func asignGrammsPer100gInvalid(isValid: Bool) {
    if isValid {
      isGrammsPer100gInvalid = true
    } else {
      isGrammsPer100gInvalid = false
    }
  }
  
  func asignAllFieldsInvalid() {
    if !isProductNameInvalid && !isGrammsConsumedInvalid && !isGrammsPer100gInvalid {
      isAllFieldsValid = true
    } else {
      isAllFieldsValid = false
    }
  }
}
