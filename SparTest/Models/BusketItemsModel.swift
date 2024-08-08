//
//  BusketItemsModel.swift
//  SparTest
//
//  Created by mix on 07.08.2024.
//

import Foundation

struct BusketItem {
    
    let id: UUID
    let title: String
    let price: Double
    var amount: Double
    var unit: StoreItem.UnitType
    
    
}
