//
//  HomeViewAddPopUp.swift
//  dCalc
//
//  Created by Daniel Rybak on 31/03/2021.
//

import SwiftUI
import Combine

struct HomeViewAddPopUp: View {
    
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
            ScrollView {
                
                Spacer()
                
                Text("Error: ")
                    .frame(height: 45)
                    .lineLimit(2)
                    .padding()
                    .foregroundColor(.red)
                    .show(isVisible: $isLookUpError)
                
                HStack {
                    Text("Product Name:")
                    
                    TextField("Type here", text: $productName)
                        .contentShape(Rectangle())
                        .padding(15)
                        .background(colorScheme == .dark ? Color.darkStart : Color.whiteEnd)
                        .cornerRadius(15)
                        .keyboardType(.alphabet)
                        .contentShape(Rectangle())
                    
                }
                .padding()
                
                Divider()
                
                HStack {
                    Text("Gramms consumed:")
                    
                    Spacer()
                    TextField("Type here", text: $grammsConsumed)
                        .contentShape(Rectangle())
                        .keyboardType(.numberPad)
                        .padding(15)
                        .background(colorScheme == .dark ? Color.darkStart : Color.whiteEnd)
                        .cornerRadius(15)
                        .contentShape(Rectangle())
                    
                }
                .padding()
                
                Divider()
                
                HStack {
                    Text("Carbs(g) per 100g:")
                    
                    TextField("Type here", text: $grammsPer100g)
                        .contentShape(Rectangle())
                        .keyboardType(.numberPad)
                        .padding(15)
                        .background(colorScheme == .dark ? Color.darkStart : Color.whiteEnd)
                        .cornerRadius(15)
                    
                    
                    Button(action: {}, label: {
                        Image(systemName: "magnifyingglass")
                    })
                    .buttonStyle(NeumorphicButtonStyle(paddingSize: 10, color: colorScheme))
                    .padding(.bottom, 10)
                    .offset(x: 0, y: 5)
                }
                .padding()
                
                Divider()
                
                HStack(spacing: geo.size.width / 2.5) {
                    Button(action: {
                        withAnimation(.spring()) {
                            isLookUpError = true
                        }
                        
                        //if success then do this
                        showHomeView = true
                        showTabBar = true
                    }, label: {
                        Text("Save")
                    })
                    .buttonStyle(NeumorphicButtonStyle(paddingSize: 25, color: colorScheme))
                    .padding(.bottom, 10)
                    
                    Button(action: {
                        showPopup.toggle()
                        showHomeView = true
                        showTabBar = true
                    }, label: {
                        Text("Cancel")
                    })
                    .buttonStyle(NeumorphicButtonStyle(paddingSize: 25, color: colorScheme))
                    .padding(.bottom, 10)
                }
                .padding(.top, geo.size.height * 0.1)
            }
            .background(NeumorphicBackground(color: colorScheme, isHighlighted: false, shape: Rectangle()))
            .cornerRadius(20)
            .frame(width: geo.size.width * 0.95, height: geo.size.height * 0.71, alignment: .center)
            .offset(x: 10, y: geo.size.height * 0.14)
            .font(.system(size: 12, weight: .bold))
            .foregroundColor(.cornBlue)
            .multilineTextAlignment(.center)
            
        }
        .adaptsToKeyboard()
    }
}

struct HomeViewAddPopUp_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewAddPopUp(colorScheme: .light, productName: .constant("Bananaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"), grammsConsumed: .constant("50"), grammsPer100g: .constant("15"), showPopup: .constant(true), showHomeView: .constant(false), showTabBar: .constant(false))
    }
}


