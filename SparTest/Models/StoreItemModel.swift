//
//  StoreItemModel.swift
//  SparTest
//
//  Created by mix on 06.08.2024.
//

import Foundation

struct StoreItem: Identifiable, Hashable {
    
    let id = UUID()
    

    enum Countri: String {
        case france = "Франция:🇫🇷"
    }
    
    enum Promo: String {
        case new = "Новинки"
        case cart = "Цена по карте"
        case hit = "Удар по ценам"
    }
    
    enum UnitType: String {
        case weight = "Кг"
        case piece = "Шт"
    }
    
    let title: String
    let importedFrom: Countri?
    let imageName: String
    let unit: UnitType
    
    var promo: Promo?
    var sale: Int?
    var price: Double
    var oldPrice: Double
    var rating: Double
    var raitingVotesCounter: Int
    
    var inOrderList = false
    var isFavorite = false
       
}

