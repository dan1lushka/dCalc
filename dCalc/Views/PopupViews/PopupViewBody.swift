//
//  PopupViewBody.swift
//  dCalc
//
//  Created by Daniel Rybak on 02/04/2021.
//

import SwiftUI

struct PopupViewBody: View {
    
    var colorScheme: ColorScheme
    
    @ObservedObject var networkingManager: NetworkingManager
    @ObservedObject var calculationManager: CalculationManager
    
    @Binding var errorMessage: String
    @Binding var isError: Bool
    @State var isLoading = false
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Product Name:")
                        .onTapGesture {
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        }
                    
                    popupTextfield(text: $calculationManager.productName, keyboard: .default)
                }
                .padding()
                
                Divider()
                
                HStack {
                    Text("Gramms consumed:")
                        .onTapGesture {
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        }
                    
                    Spacer()
                    
                    popupTextfield(text: $calculationManager.grammsConsumed, keyboard: .numberPad)
                }
                .padding()
                
                Divider()
                
                HStack {
                    Text("Carbs(g) per 100g:")
                        .onTapGesture {
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        }
                    
                    popupTextfield(text: $calculationManager.grammsPer100g, keyboard: .numberPad)
                    searchButton
                }
                .padding()
                
                Divider()
            }
            ProgressView("Loading")
                .frame(width: 100, height: 100, alignment: .center)
                .background(NeumorphicBackground(color: colorScheme, isHighlighted: true, shape: Rectangle()))
                .show(isVisible: $isLoading)
        }
    }
    
    var searchButton: some View {
        return Button(action: {
            
            if !calculationManager.productName.isEmpty {
                
                isLoading = true
                
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                
                networkingManager.loadData(ingredient: calculationManager.productName) {
                    
                    if networkingManager.errorMessage.isEmpty {
                        
                        if let gramsPer100gResponse = networkingManager.response?.parsed.first?.food.nutrients.chocdf {
                            isError = false
                            calculationManager.grammsPer100g = String(gramsPer100gResponse)
                        } else {
                            isError = true
                            errorMessage = "No carbs data found for a given product"
                        }
                        
                    } else {
                        isError = true
                        errorMessage = networkingManager.errorMessage
                        calculationManager.grammsPer100g = ""
                    }
                    
                    isLoading = false
                }
            } else {
                isError = true
                errorMessage = "Product name cannot be empty"
                calculationManager.grammsPer100g = ""
            }
            
        }, label: {
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
        PopupViewBody(colorScheme: .light, networkingManager: NetworkingManager(), calculationManager: CalculationManager(), errorMessage: .constant(""), isError: .constant(false))
            .background(NeumorphicBackground(color: .light, isHighlighted: false, shape: Rectangle()))
            .font(.system(size: 12, weight: .bold))
            .foregroundColor(.cornBlue)
            .multilineTextAlignment(.center)
    }
}
