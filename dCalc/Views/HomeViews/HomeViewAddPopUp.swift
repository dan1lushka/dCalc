//
//  HomeViewAddPopUp.swift
//  dCalc
//
//  Created by Daniel Rybak on 31/03/2021.
//

import SwiftUI

struct HomeViewAddPopUp: View {
    
    var colorScheme: ColorScheme
    
    @Binding var productName: String
    @Binding var grammsConsumed: String
    @Binding var grammsPer100g: String
    
    @Binding var showPopup: Bool
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                
                Spacer()
                
                HStack {
                    Text("Product Name")
                        .padding()
                        .background(NeumorphicBackground(color: colorScheme, isHighlighted: false, shape: Rectangle()))
                        
                    TextField("Type here", text: $productName)
                        .padding()
                        .background(NeumorphicBackground(color: colorScheme, isHighlighted: false, shape: Rectangle()))
                        .keyboardType(.alphabet)
                        
                }
                .padding()
                
                HStack {
                    Text("Gramms consumed")
                        .padding()
                        .background(NeumorphicBackground(color: colorScheme, isHighlighted: false, shape: Rectangle()))
                        .layoutPriority(1)
                    TextField("Type here", text: $grammsConsumed)
                        .keyboardType(.numberPad)
                        .padding()
                        .background(NeumorphicBackground(color: colorScheme, isHighlighted: false, shape: Rectangle()))
                        .layoutPriority(0)
                }
                .padding()
                
                HStack {
                    Text("Carbs(g) per 100g")
                        .padding()
                        .background(NeumorphicBackground(color: colorScheme, isHighlighted: false, shape: Rectangle()))
                        .layoutPriority(1)
                    
                    TextField("Type here", text: $grammsPer100g)
                        .keyboardType(.numberPad)
                        .padding()
                        .background(NeumorphicBackground(color: colorScheme, isHighlighted: false, shape: Rectangle()))
                        .layoutPriority(0)
                    
                    Button(action: {}, label: {
                        Image(systemName: "magnifyingglass")
                    })
                    .buttonStyle(NeumorphicButtonStyle(paddingSize: 10, color: colorScheme))
                    .padding(.bottom, 10)
                }
                .padding()
                
                Spacer()
                
                HStack(spacing: geo.size.width / 3) {
                    
                    Button(action: {}, label: {
                        Text("Save")
                    })
                    .buttonStyle(NeumorphicButtonStyle(paddingSize: 25, color: colorScheme))
                    .padding(.bottom, 10)
                    
                    Button(action: {
                        showPopup.toggle()
                    }, label: {
                        Text("Cancel")
                    })
                    .buttonStyle(NeumorphicButtonStyle(paddingSize: 25, color: colorScheme))
                    .padding(.bottom, 10)
                }
            }
            .background(NeumorphicBackground(color: colorScheme, isHighlighted: false, shape: Rectangle()))
            .frame(width: geo.size.width * 0.95, height: geo.size.height * 0.6, alignment: .center)
            .offset(x: 10, y: geo.size.height * 0.15)
            .font(.system(size: 15, weight: .bold))
            .foregroundColor(.cornBlue)
            .multilineTextAlignment(.center)
        }
        
    }
}

struct HomeViewAddPopUp_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewAddPopUp(colorScheme: .light, productName: .constant("Bananaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"), grammsConsumed: .constant("50"), grammsPer100g: .constant("15"), showPopup: .constant(true))
    }
}
