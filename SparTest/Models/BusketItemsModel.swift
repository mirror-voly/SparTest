//
//  BusketItemsModel.swift
//  SparTest
//
//  Created by mix on 07.08.2024.
//

import Foundation

struct BusketItem {
    
    enum Unit: String {
        case weight = "Кг"
        case piece = "Шт"
    }
    
    let title: String
    let price: Double
    var amount: Double
    var units: Unit
    
    let id: UUID
    
}
