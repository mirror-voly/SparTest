//
//  StoreItemModel.swift
//  SparTest
//
//  Created by mix on 06.08.2024.
//

import Foundation

struct StoreItem {
    
    enum Countries: String {
        case france = "Франция:🇫🇷"
    }
    
    enum Promo: String {
        case new = "Новинки"
        case cart = "Цена по карте"
        case hit = "Удар по ценам"
    }
    
    let title: String
    let importedFrom: Countries?
    let imageName: String
    
    
    var promo: Promo?
    var sale: Int?
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
