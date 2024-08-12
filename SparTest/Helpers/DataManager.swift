//
//  DataManager.swift
//  SparTest
//
//  Created by mix on 06.08.2024.
//

import Foundation

@Observable
final class DataManager {
    
    var busket: [BusketItem] = []
    var storeItems: [StoreItem] = [
        StoreItem(title: "Cыр Ламбер 500/0 230г", importedFrom: nil, imageName: "1", unit: .piece, promo: .hit, price: 309, oldPrice: 500, rating: 4.6, raitingVotesCounter: 7),
        StoreItem(title: "Огурцы тепличные cадово-огородные", importedFrom: .france, imageName: "2", unit: .weight, sale: 25, price: 104, oldPrice: 240, rating: 1.2, raitingVotesCounter: 5),
        StoreItem(title: "Ролл Маленькая Япония 216г", importedFrom: nil, imageName: "3", unit: .piece, promo: .cart, price: 129, oldPrice: 457, rating: 3.9, raitingVotesCounter: 1),
        StoreItem(title: "Салат Овощной с Крабовыми Палочками", importedFrom: nil, imageName: "4", unit: .weight, promo: .new, price: 19, oldPrice: 40, rating: 5.0, raitingVotesCounter: 11)
    ]
    
}
