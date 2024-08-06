//
//  StoreItemModel.swift
//  SparTest
//
//  Created by mix on 06.08.2024.
//

import Foundation

struct StoreItem {
    
    enum Countries {
        case france
    }
    
    let title: String
    let importedFrom: Countries?
    let imageName: String
    
    var promo: String?
    var price: Double
    var oldPrice: Double
    var rating: Double
    var raitingVotesCounter: Int
    
    var inOrderList = false
    var isFavorite = false
       
}

extension StoreItem: Hashable, Identifiable {
    var id: UUID {
        UUID()
    }
    
    
}
