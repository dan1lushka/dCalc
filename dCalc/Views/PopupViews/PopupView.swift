//
//  HomeViewAddPopUp.swift
//  dCalc
//
//  Created by Daniel Rybak on 31/03/2021.
//

import SwiftUI

struct PopupView: View {
    
    var colorScheme: ColorScheme
    
    @Binding var productName: String
    @Binding var grammsConsumed: String
    @Binding var grammsPer100g: String
    
    @Binding var showPopup: Bool
    @Binding var showHomeView: Bool
    @Binding var showTabBar: Bool
    
    @State private var isLookUpError = false
    
    var body: some View {
        
        GeometryReader { geo in
            
            VStack {
                
                Spacer()
                
                ZStack {
                    popupClearRectangle(size: geo.size.height * 0.2)
                    errorText
                }
                
                PopupViewBody(colorScheme: colorScheme, productName: $productName, grammsConsumed: $grammsConsumed, grammsPer100g: $grammsPer100g)
                
                popupClearRectangle(size: geo.size.height * 0.15)
                
                HStack(spacing: geo.size.width / 2.5) {
                    popupBottomButton(label: "Save")
                    popupBottomButton(label: "Cancel")
                }
                .padding(.bottom, 50)
            }
            .background(NeumorphicBackground(color: colorScheme, isHighlighted: false, shape: Rectangle()))
            .font(.system(size: 12, weight: .bold))
            .foregroundColor(.cornBlue)
            .multilineTextAlignment(.center)
        }
        .adaptsToKeyboard()
    }
    
    var errorText: some View {
        return Text("Error: ")
            .frame(height: 45)
            .lineLimit(2)
            .padding()
            .foregroundColor(.red)
            .show(isVisible: $isLookUpError)
    }
    
    func popupClearRectangle(size: CGFloat) -> some View {
        return Rectangle()
            .frame(height: size)
            .background(Color.clear)
            .foregroundColor(.clear)
            .contentShape(Rectangle())
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
            }
    }
    
    func popupBottomButton(label: String) -> some View {
        return Button(action: {
            if label == "Save" {
                isLookUpError = true
            } else {
                showPopup = false
            }
            
            showHomeView = true
            showTabBar = true
        }, label: {
            Text(label)
        })
        .buttonStyle(NeumorphicButtonStyle(paddingSize: 25, color: colorScheme))
    }
    
}

struct HomeViewAddPopUp_Previews: PreviewProvider {
    static var previews: some View {
        PopupView(colorScheme: .light, productName: .constant("Bananaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"), grammsConsumed: .constant("50"), grammsPer100g: .constant("15"), showPopup: .constant(true), showHomeView: .constant(false), showTabBar: .constant(false))
    }
}
