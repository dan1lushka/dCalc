//
//  HomeViewAddPopUp.swift
//  dCalc
//
//  Created by Daniel Rybak on 31/03/2021.
//

import SwiftUI

struct PopupView: View {
  
  @EnvironmentObject var popupViewManager: PopupViewManager
  
  var body: some View {
    
    GeometryReader { geo in
      VStack {
        
        Spacer()
        
        ZStack {
          popupClearRectangle(size: geo.size.height * 0.2)
          errorText(message: nil)
        }
        
        ZStack {
          PopupViewBody(width: geo.size.width, height: geo.size.height)
          PopupAutoCompleteView(height: geo.size.height, width: geo.size.width, isEditingProductName: $popupViewManager.isEditingProductName)
        }
        
        popupClearRectangle(size: geo.size.height * 0.15)
        
        HStack(spacing: geo.size.width / 2.5) {
          PopupSaveButtonView()
          PopupCancelButtonView()
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
    PopupView()
      .environmentObject(PopupViewManager())
  }
}
