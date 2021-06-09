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
  @Published var imageURLList = [String]()
  
  func populateImageURLsFromAutoCompleteList(networkingManager: NetworkingManager) {
    if let list = autoCompleteList as? [String] {
      for item in list {
        networkingManager.loadData(ingredient: item, objectType: FoodInfoResponse.self) {
          if let response = networkingManager.response as? FoodInfoResponse {
            self.imageURLList.append(response.parsed.first?.food.image ?? "")
          }
        }
      }
    }
  }
  
  func asignProductNameValid(isInvalid: Bool) {
    isProductNameInvalid = isInvalid
  }
  
  func asignGrammsConsumedInvalid(isInvalid: Bool) {
    isGrammsConsumedInvalid = isInvalid
  }
  
  func asignGrammsPer100gInvalid(isInvalid: Bool) {
    isGrammsPer100gInvalid = isInvalid
  }
  
  func asignAllFieldsInvalid() {
    isAllFieldsValid = !isProductNameInvalid && !isGrammsConsumedInvalid && !isGrammsPer100gInvalid
  }
}
