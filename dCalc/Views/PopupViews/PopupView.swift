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
    @ObservedObject var networkingManager: NetworkingManager
    
    @State private var isError = false
    @State private var errorMessage = ""
    
    var body: some View {
        
        GeometryReader { geo in
            
            VStack {
                
                Spacer()
                
                ZStack {
                    popupClearRectangle(size: geo.size.height * 0.2)
                    errorText(message: nil)
                }
                
                PopupViewBody(colorScheme: colorScheme, networkingManager: networkingManager, calculationManager: calculationManager, errorMessage: $errorMessage, isError: $isError)
                
                popupClearRectangle(size: geo.size.height * 0.15)
                
                HStack(spacing: geo.size.width / 2.5) {
                    popupBottomButton(label: "Save")
                    popupBottomButton(label: "Cancel")
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
        return Text("Error: \(errorMessage)")
            .frame(height: 45)
            .lineLimit(2)
            .padding()
            .foregroundColor(.red)
            .show(isVisible: $isError)
    }
    
    func popupClearRectangle(size: CGFloat) -> some View {
        return Rectangle()
            .frame(height: size)
            .background(Color.clear)
            .foregroundColor(.clear)
            .contentShape(Rectangle())
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
    }
    
    func popupBottomButton(label: String) -> some View {
        return Button(action: {
            if label == "Save" {
                let isProductNameInvalid = calculationManager.productName.isEmptyOrZero
                let isGrammsConsumedInvalid = calculationManager.grammsConsumed.isEmptyOrZero
                let isGrammsPer100gInvalid = calculationManager.grammsPer100g.isEmptyOrZero
                
                errorMessage = "\(isProductNameInvalid ? "Product name field is invalid. " : "")\(isGrammsConsumedInvalid ? "Gramms consumed field is invalid. " : "")\(isGrammsPer100gInvalid ? "Gramms of carbs per 100g of product field is invalid" : "")"
                
                let isAllFieldsValid = !isProductNameInvalid && !isGrammsConsumedInvalid && !isGrammsPer100gInvalid
                
                if isAllFieldsValid {
                    calculationManager.consumedFoodItems.items.append(
                        ConsumedFood.Item(
                            productName: calculationManager.productName,
                            grammsConsumed: Double(calculationManager.grammsConsumed)!.round(to: 1),
                            grammsPer100g: Double(calculationManager.grammsPer100g)!.round(to: 1)
                        )
                    )
                    
                    calculationManager.dosage = calculationManager.getDosage()
                    closePopup()
                } else {
                    isError = true
                }
            } else {
                closePopup()
            }
        }, label: {
            Text(label)
        })
        .buttonStyle(NeumorphicButtonStyle(paddingSize: 25, color: colorScheme))
    }
    
    func closePopup() {
        viewTransitionManager.showPopup = false
        viewTransitionManager.showHomeView = true
        viewTransitionManager.showTabBar = true
        isError = false
    }
}

struct HomeViewAddPopUp_Previews: PreviewProvider {
    static var previews: some View {
        PopupView(calculationManager: CalculationManager(), viewTransitionManager: ViewTransitionManager(), networkingManager: NetworkingManager())
    }
}
