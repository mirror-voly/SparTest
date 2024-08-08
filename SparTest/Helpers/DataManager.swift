//
//  DataManager.swift
//  SparTest
//
//  Created by mix on 06.08.2024.
//

import Foundation

@Observable
class DataManager {
    
    var busket: [BusketItem] = []
    
    var storeItems: [StoreItem] = [
        StoreItem(title: "сыр Ламбер 500/0 230г", importedFrom: nil, imageName: "1", unit: .piece, promo: .hit, price: 1709, oldPrice: 2999, rating: 3.6, raitingVotesCounter: 37),
        StoreItem(title: "сыр Ламбер 500/0 230г", importedFrom: .france, imageName: "1", unit: .weight, sale: 25, price: 1709, oldPrice: 2999, rating: 3.6, raitingVotesCounter: 37),
        StoreItem(title: "сыр Ламбер 500/0 230г", importedFrom: nil, imageName: "1", unit: .piece, promo: .cart, price: 1709, oldPrice: 2999, rating: 3.6, raitingVotesCounter: 37),
        StoreItem(title: "сыр Ламбер 500/0 230г", importedFrom: nil, imageName: "1", unit: .weight, promo: .new, price: 1709, oldPrice: 2999, rating: 3.6, raitingVotesCounter: 37)
    ]
    
}
