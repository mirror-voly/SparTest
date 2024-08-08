//
//  Calculate.swift
//  SparTest
//
//  Created by mix on 07.08.2024.
//

import Foundation

struct Calculate {
    
    func convertToSrting(price: Double) -> String {
        let string = String(price).replacingOccurrences(of: ".", with: ",")
        return string
    }
    
    func convertToArray(price: Double) -> [String] {
        let string = String(format: "%.2f", price)
        let stringArray = string.components(separatedBy: ".")
        return stringArray
    }
    
    func separateStringsWithFlag(inputString: String) -> [String] {
        let strings = inputString.components(separatedBy: ":")
        return strings
    }
    
    func changeCounter(isAdding: Bool, counter: inout Double, unit: StoreItem.UnitType) {
        let changeValue: Double = unit == .weight ? 0.1 : 1.0
        counter += isAdding ? changeValue : -changeValue
    }
    
    func prepareCounter(counter: Double, unit: StoreItem.UnitType) -> String {
        let formattedCouterString = String(format: "%.1f", counter)
        let preparedCounter = unit == .weight ? formattedCouterString : String(Int(counter))
        return preparedCounter
    }
    
    func preparePrice(counter: Double, price: Double) -> String {
        let price = counter * price
        let formattedPriceString = String(format: "%.2f", price)
        return formattedPriceString
    }
}
