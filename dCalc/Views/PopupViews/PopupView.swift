//
//  HomeViewAddPopUp.swift
//  dCalc
//
//  Created by Daniel Rybak on 31/03/2021.
//

import SwiftUI

struct PopupView: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    @ObservedObject var calculationManager: CalculationManager
    @ObservedObject var viewTransitionManager: ViewTransitionManager

    @State private var isLookUpError = false
    
    var body: some View {
        
        GeometryReader { geo in
            
            VStack {
                
                Spacer()
                
                ZStack {
                    popupClearRectangle(size: geo.size.height * 0.2)
                    errorText
                }
                
                PopupViewBody(colorScheme: colorScheme, calculationManager: calculationManager)
                
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
                viewTransitionManager.showPopup = false
            }
            
            viewTransitionManager.showHomeView = true
            viewTransitionManager.showTabBar = true
        }, label: {
            Text(label)
        })
        .buttonStyle(NeumorphicButtonStyle(paddingSize: 25, color: colorScheme))
    }
    
}

struct HomeViewAddPopUp_Previews: PreviewProvider {
    static var previews: some View {
        PopupView(calculationManager: CalculationManager(), viewTransitionManager: ViewTransitionManager())
    }
}
