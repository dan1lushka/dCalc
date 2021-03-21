//
//  HomeViewExtraButtons.swift
//  dCalc
//
//  Created by Daniel Rybak on 21/03/2021.
//

import SwiftUI

struct HomeViewExtraButtons: View {
    
    @Binding var showButtons: Bool
    
    var colorScheme: ColorScheme
    let buttonImages = ["highlighter", "barcode", "camera"]
    
    var body: some View {
        VStack {
            HStack {
                ForEach(0 ..< 3) { num in
                    Button(action: {
                        //TODO: add action
                    }) {
                        Image(systemName: buttonImages[num])
                            .font(.system(size: 25, weight: .regular))
                            .foregroundColor(.blue)
                    }
                    .buttonStyle(NeumorphicButtonStyle(paddingSize: 15, color: (colorScheme == .light ? .light : .dark)))
                    .padding()
                    .show(isVisible: $showButtons)
                }
            }
        }
    }
}

struct HomeViewExtraButtons_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewExtraButtons(showButtons: .constant(true), colorScheme: .light)
    }
}
