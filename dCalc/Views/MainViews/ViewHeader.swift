//
//  ViewHeader.swift
//  dCalc
//
//  Created by Daniel Rybak on 24/03/2021.
//

import SwiftUI

struct ViewHeader: View {
    var width: CGFloat
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(.cornBlue)
            .font(.system(size: 40))
            .bold()
            .frame(width: width, alignment: .leading)
            .padding(.top, 50)
    }
}

struct ViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        ViewHeader(width: 250, text: "View Header")
    }
}
