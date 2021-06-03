//
//  PopupAutcompleteView.swift
//  dCalc
//
//  Created by Daniel Rybak on 02/05/2021.
//

import SwiftUI

struct PopupAutoCompleteView: View {
  
  var height: CGFloat
  var width: CGFloat
  var colorScheme: ColorScheme
  
  @ObservedObject var calculationManager: CalculationManager
  @ObservedObject var popupViewManager: PopupViewManager
  @ObservedObject var networkingManager: NetworkingManager
  
  @Binding var isEditingProductName: Bool
  
  var body: some View {
    VStack {
      ScrollView {
        if let stringArray = popupViewManager.autoCompleteList as? AutoCompleteResponse {
          ForEach(stringArray, id: \.self) { item in
            Text("\(item)")
              .frame(width: width * 0.95, height: 20, alignment: .leading)
              .padding(.horizontal, 10)
              .padding(.vertical, 5)
              .onTapGesture {
                popupViewManager.isEditingProductName = false
                calculationManager.productName = String(item)
                hideKeyboard()
                print("tapped \(item) item")
              }
          }
        }
      }
      .frame(width: width * 0.95, height: height / 2.5, alignment: .bottom)
      .background(NeumorphicBackground(color: colorScheme, isHighlighted: false, shape: Rectangle()))
      .padding(.horizontal, 10)
      .position(x: width / 2, y: height / 3)
      .show(isVisible: $isEditingProductName)
    }
  }
}

struct PopupAutcompleteView_Previews: PreviewProvider {
  static var previews: some View {
    PopupAutoCompleteView(height: 300,
                          width: 300,
                          colorScheme: .light,
                          calculationManager: CalculationManager(),
                          popupViewManager: PopupViewManager(),
                          networkingManager: NetworkingManager(),
                          isEditingProductName: .constant(true)
    )
  }
}
