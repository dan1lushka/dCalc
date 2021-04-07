//
//  PopupViewBody.swift
//  dCalc
//
//  Created by Daniel Rybak on 02/04/2021.
//

import SwiftUI

struct PopupViewBody: View {
    
    var colorScheme: ColorScheme
    
    @ObservedObject var calculationManager: CalculationManager
    
    var body: some View {
        VStack {
            HStack {
                Text("Product Name:")
                    .onTapGesture {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                    }
                
                popupTextfield(text: $calculationManager.productName, keyboard: .default)
            }
            .padding()
            
            Divider()
            
            HStack {
                Text("Gramms consumed:")
                    .onTapGesture {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                    }
                
                Spacer()
                
                popupTextfield(text: $calculationManager.grammsConsumed, keyboard: .numberPad)
            }
            .padding()
            
            Divider()
            
            HStack {
                Text("Carbs(g) per 100g:")
                    .onTapGesture {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                    }
                
                popupTextfield(text: $calculationManager.grammsPer100g, keyboard: .numberPad)
                lookupButton
            }
            .padding()
            
            Divider()
        }
    }
    
    var lookupButton: some View {
        return Button(action: {}, label: {
            Image(systemName: "magnifyingglass")
        })
        .buttonStyle(NeumorphicButtonStyle(paddingSize: 10, color: colorScheme))
        .padding(.bottom, 10)
        .offset(x: 0, y: 5)
    }
    
    //TODO: Check if the textfield tappable area can be changed without increasing the scale effect or font size
    func popupTextfield(text: Binding<String>, keyboard: UIKeyboardType) -> some View {
        return TextField("", text: text)
            .padding()
            .scaleEffect(x: 2, y: 2)
            .background(colorScheme == .dark ? Color.darkStart : Color.whiteEnd)
            .cornerRadius(15)
            .keyboardType(keyboard)
    }
}

struct PopupViewBody_Previews: PreviewProvider {
    static var previews: some View {
        PopupViewBody(colorScheme: .light, calculationManager: CalculationManager())
            .background(NeumorphicBackground(color: .light, isHighlighted: false, shape: Rectangle()))
            .font(.system(size: 12, weight: .bold))
            .foregroundColor(.cornBlue)
            .multilineTextAlignment(.center)
    }
}
