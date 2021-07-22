//
//  PopupViewBody.swift
//  dCalc
//
//  Created by Daniel Rybak on 02/04/2021.
//

import SwiftUI

@available(iOS 15.0, *)
struct PopupViewBody: View {
  
  enum Field: Hashable {
    case productName
    case grammsConsumed
    case carbsPer100g
  }
  
  var width: CGFloat
  var height: CGFloat
  
  @Environment(\.colorScheme) var colorScheme: ColorScheme
  
  @EnvironmentObject var calculationManager: CalculationManager
  @EnvironmentObject var networkingManager: NetworkingManager
  @EnvironmentObject var popupViewManager: PopupViewManager
  
  @FocusState private var focusedField: Field?
  
  var body: some View {
    ZStack {
      VStack {
        popupTextfield(placeholderText: "Product name", text: $calculationManager.productName, keyboard: .default)
          .onTapGesture {
            popupViewManager.isEditingProductName = true
          }
          .focused($focusedField, equals: .productName)
          .onSubmit {
            focusedField = .grammsConsumed
          }
        
        popupTextfield(placeholderText: "Gramms consumed", text: $calculationManager.grammsConsumed, keyboard: .numberPad)
          .focused($focusedField, equals: .grammsConsumed)
          .onSubmit {
            focusedField = .carbsPer100g
          }
        
        HStack {
          popupTextfield(placeholderText: "Carbs(g) per 100g", text: $calculationManager.grammsPer100g, keyboard: .numberPad)
            .focused($focusedField, equals: .carbsPer100g)
          PopupSearchButtonView()
        }
      }
      
      ProgressView("Loading")
        .frame(width: 100, height: 100, alignment: .center)
        .background(NeumorphicBackground(isHighlighted: true, shape: Rectangle()))
        .show(isVisible: $popupViewManager.isLoading)
    }
  }
  
  // todo: check focusState button containing textfield
  // todo: Check if the textfield tappable area can be changed without increasing the scale effect or font size
  func popupTextfield(placeholderText: String, text: Binding<String>, keyboard: UIKeyboardType) -> some View {
    return TextField(placeholderText, text: text, onCommit: {
      popupViewManager.isEditingProductName = false
    })
      .onChange(of: text.wrappedValue, perform: { _ in
        networkingManager.loadData(ingredient: text.wrappedValue, objectType: AutoCompleteResponse.self) {
          if let response = networkingManager.response as? AutoCompleteResponse {
            popupViewManager.autoCompleteList = response
            print(popupViewManager.autoCompleteList)
          }
        }
      })
      .padding()
      .background(colorScheme == .dark ? Color.darkStart : Color.whiteEnd)
      .cornerRadius(15)
      .keyboardType(keyboard)
      .disableAutocorrection(true)
  }
}

struct PopupViewBody_Previews: PreviewProvider {
  static var previews: some View {
    if #available(iOS 15.0, *) {
      PopupViewBody(width: 300, height: 300)
        .environmentObject(CalculationManager())
        .environmentObject(NetworkingManager())
        .environmentObject(PopupViewManager())
        .background(NeumorphicBackground(isHighlighted: false, shape: Rectangle()))
        .font(.system(size: 12, weight: .bold))
        .foregroundColor(.cornBlue)
        .multilineTextAlignment(.center)
    } else {
      // Fallback on earlier versions
    }
  }
}
