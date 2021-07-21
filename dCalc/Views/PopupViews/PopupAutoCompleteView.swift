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
  
  @Environment(\.colorScheme) var colorScheme: ColorScheme
  
  @EnvironmentObject var calculationManager: CalculationManager
  @EnvironmentObject var popupViewManager: PopupViewManager
  @EnvironmentObject var networkingManager: NetworkingManager
  
  @Binding var isEditingProductName: Bool
  
  var body: some View {
    VStack {
      ScrollView {
        if let nameArray = popupViewManager.autoCompleteList as? AutoCompleteResponse {
          ForEach(nameArray, id: \.self) { item in
            HStack {
              if #available(iOS 15.0, *) {
                AsyncImage(url: URL(string: popupViewManager.imageURLList.first ?? "")) { image in
                  image.resizable(resizingMode: .tile)
                } placeholder: {
                  Image(systemName: "arrow.down.doc.fill")
                }
                .frame(width: 25, height: 20, alignment: .center)
                .padding(.leading, 10)
              }
              Text("\(item)")
            }
            .frame(width: width * 0.95, height: 20, alignment: .leading)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .onTapGesture {
              popupViewManager.isEditingProductName = false
              calculationManager.productName = String(item)
              hideKeyboard()
              print("tapped \(item) item")
            }
            Divider()
          }
        }
      }
      .frame(width: width * 0.95, height: height / 2.5, alignment: .bottom)
      .background(NeumorphicBackground(isHighlighted: false, shape: Rectangle()))
      .padding(.horizontal, 10)
      .position(x: width / 2, y: height / 3)
      .show(isVisible: $isEditingProductName)
    }
  }
}

struct PopupAutcompleteView_Previews: PreviewProvider {
  static var previews: some View {
    PopupAutoCompleteView(height: 300, width: 300, isEditingProductName: .constant(true))
      .environmentObject(CalculationManager())
      .environmentObject(PopupViewManager())
      .environmentObject(NetworkingManager())
  }
}
