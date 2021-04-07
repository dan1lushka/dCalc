//
//  TypeExtensions.swift
//  dCalc
//
//  Created by Daniel Rybak on 04/04/2021.
//

import Foundation

extension String {
    var isEmptyOrZero: Bool {
        get {
            self.count == 0 || self == "0"
        }
    }
}

extension Double {
    func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
