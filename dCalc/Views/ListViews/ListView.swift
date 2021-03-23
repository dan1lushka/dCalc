//
//  ListView.swift
//  dCalc
//
//  Created by Daniel Rybak on 18/03/2021.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        List {
            ForEach(1...5, id: \.self) {
                Text("\($0)")
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
