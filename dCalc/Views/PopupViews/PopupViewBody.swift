//
//  PopupViewBody.swift
//  dCalc
//
//  Created by Daniel Rybak on 02/04/2021.
//

import SwiftUI

struct PopupViewBody: View {
  
  @Environment(\.colorScheme) var colorScheme: ColorScheme
  var width: CGFloat
  var height: CGFloat
  
  @ObservedObject var networkingManager: NetworkingManager
  @ObservedObject var calculationManager: CalculationManager
  @ObservedObject var popupViewManager: PopupViewManager
  
  var body: some View {
    ZStack {
      VStack {
        productNameSecion
        Divider()
        
        grammsConsumedSection
        Divider()
        
        carbsPer100gSection
        Divider()
      }
      
      ProgressView("Loading")
        .frame(width: 100, height: 100, alignment: .center)
        .background(NeumorphicBackground(isHighlighted: true, shape: Rectangle()))
        .show(isVisible: $popupViewManager.isLoading)
    }
  }
  
  var productNameSecion: some View {
    return  HStack {
      Text("Product Name:")
        .onTapGesture {
          hideKeyboard()
        }
      
      popupTextfield(text: $calculationManager.productName, keyboard: .default)
        .onTapGesture {
          popupViewManager.isEditingProductName = true
        }
    }
    .padding(.horizontal, 10)
  }
  
  var grammsConsumedSection: some View {
    HStack {
      Text("Gramms consumed:")
        .onTapGesture {
          hideKeyboard()
        }
      
      Spacer()
      
      popupTextfield(text: $calculationManager.grammsConsumed, keyboard: .numberPad)
    }
    .padding()
  }
  
  var carbsPer100gSection: some View {
    HStack {
      Text("Carbs(g) per 100g:")
        .onTapGesture {
          hideKeyboard()
        }
      
      popupTextfield(text: $calculationManager.grammsPer100g, keyboard: .numberPad)
      
      PopupSearchButtonView(networkingManager: networkingManager,
                            calculationManager: calculationManager,
                            popupViewManager: popupViewManager
      )
    }
    .padding()
  }
  // todo: check focusState button containing textifield
  // todo: Check if the textfield tappable area can be changed without increasing the scale effect or font size
  func popupTextfield(text: Binding<String>, keyboard: UIKeyboardType) -> some View {
    return TextField("", text: text, onCommit: {
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
    .scaleEffect(x: 2, y: 2)
    .background(colorScheme == .dark ? Color.darkStart : Color.whiteEnd)
    .cornerRadius(15)
    .keyboardType(keyboard)
    .disableAutocorrection(true)
  }
}

struct PopupViewBody_Previews: PreviewProvider {
  static var previews: some View {
    PopupViewBody(width: 300,
                  height: 300,
                  networkingManager: NetworkingManager(),
                  calculationManager: CalculationManager(),
                  popupViewManager: PopupViewManager()
    )
      .background(NeumorphicBackground(isHighlighted: false, shape: Rectangle()))
      .font(.system(size: 12, weight: .bold))
      .foregroundColor(.cornBlue)
      .multilineTextAlignment(.center)
  }
}
