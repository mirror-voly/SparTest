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
    
    func separatStringsWithFlag(inputString: String) -> [String] {
        let strings = inputString.components(separatedBy: ":")
        return strings
    }
    
}
