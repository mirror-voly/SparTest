//
//  DataManager.swift
//  SparTest
//
//  Created by mix on 06.08.2024.
//

import Foundation

struct DataManager {
    
    static var storeItems: [StoreItem] = [
        StoreItem(title: "сыр Ламбер 500/0 230г", importedFrom: nil, imageName: "1", promo: .hit, price: 1709, oldPrice: 2999, rating: 3.6, raitingVotesCounter: 37),
        StoreItem(title: "сыр Ламбер 500/0 230г", importedFrom: .france, imageName: "1", sale: 25, price: 1709, oldPrice: 2999, rating: 3.6, raitingVotesCounter: 37),
        StoreItem(title: "сыр Ламбер 500/0 230г", importedFrom: nil, imageName: "1", promo: .cart, price: 1709, oldPrice: 2999, rating: 3.6, raitingVotesCounter: 37),
        StoreItem(title: "сыр Ламбер 500/0 230г", importedFrom: nil, imageName: "1", promo: .new, price: 1709, oldPrice: 2999, rating: 3.6, raitingVotesCounter: 37)
    ]
    
}
