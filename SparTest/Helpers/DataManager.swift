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
        StoreItem(title: "Огурцы тепличные cадово-огородные", importedFrom: .france, imageName: "2", unit: .weight, sale: 25, price: 107, oldPrice: 240, rating: 1.2, raitingVotesCounter: 5),
        StoreItem(title: "Ролл Маленькая Япония 216г", importedFrom: nil, imageName: "3", unit: .piece, promo: .cart, price: 129, oldPrice: 157, rating: 3.9, raitingVotesCounter: 1),
        StoreItem(title: "Салат Овощной с Крабовыми Палочками", importedFrom: nil, imageName: "4", unit: .weight, promo: .new, price: 19, oldPrice: 60, rating: 5.0, raitingVotesCounter: 11),
        StoreItem(title: "Огурцы тепличные cадово-огородные", importedFrom: .france, imageName: "5", unit: .weight, sale: 30, price: 107, oldPrice: 240, rating: 1.2, raitingVotesCounter: 5),
        StoreItem(title: "Ролл Маленькая Япония 216г", importedFrom: nil, imageName: "6", unit: .piece, promo: .cart, price: 129, oldPrice: 157, rating: 3.9, raitingVotesCounter: 1),
        StoreItem(title: "Салат Овощной с Крабовыми Палочками", importedFrom: nil, imageName: "7", unit: .weight, promo: .new, price: 19, oldPrice: 60, rating: 5.0, raitingVotesCounter: 11),
        StoreItem(title: "Огурцы тепличные cадово-огородные", importedFrom: .france, imageName: "8", unit: .weight, sale: 60, price: 107, oldPrice: 240, rating: 1.2, raitingVotesCounter: 5),
        StoreItem(title: "Ролл Маленькая Япония 216г", importedFrom: nil, imageName: "9", unit: .piece, promo: .hit, price: 129, oldPrice: 157, rating: 3.9, raitingVotesCounter: 1),
        StoreItem(title: "Салат Овощной с Крабовыми Палочками", importedFrom: nil, imageName: "10", unit: .weight, promo: .new, price: 19, oldPrice: 60, rating: 5.0, raitingVotesCounter: 11),
        StoreItem(title: "Огурцы тепличные cадово-огородные", importedFrom: .france, imageName: "11", unit: .weight, sale: 50, price: 107, oldPrice: 240, rating: 1.2, raitingVotesCounter: 5),
        StoreItem(title: "Ролл Маленькая Япония 216г", importedFrom: nil, imageName: "12", unit: .piece, promo: .cart, price: 129, oldPrice: 157, rating: 3.9, raitingVotesCounter: 1),
        StoreItem(title: "Салат Овощной с Крабовыми Палочками", importedFrom: nil, imageName: "13", unit: .weight, promo: .hit, price: 19, oldPrice: 60, rating: 5.0, raitingVotesCounter: 11),
        StoreItem(title: "Огурцы тепличные cадово-огородные", importedFrom: .france, imageName: "14", unit: .weight, sale: 25, price: 107, oldPrice: 240, rating: 1.2, raitingVotesCounter: 5),
        StoreItem(title: "Ролл Маленькая Япония 216г", importedFrom: nil, imageName: "15", unit: .piece, promo: .cart, price: 129, oldPrice: 157, rating: 3.9, raitingVotesCounter: 1),
        StoreItem(title: "Салат Овощной с Крабовыми Палочками", importedFrom: nil, imageName: "16", unit: .weight, promo: .new, price: 19, oldPrice: 60, rating: 5.0, raitingVotesCounter: 11),
        StoreItem(title: "Салат Овощной с Крабовыми Палочками", importedFrom: nil, imageName: "17", unit: .weight, promo: .new, price: 19, oldPrice: 60, rating: 5.0, raitingVotesCounter: 11),
        StoreItem(title: "Салат Овощной с Крабовыми Палочками", importedFrom: nil, imageName: "18", unit: .weight, promo: .new, price: 19, oldPrice: 60, rating: 5.0, raitingVotesCounter: 11)
    ]
    
}
