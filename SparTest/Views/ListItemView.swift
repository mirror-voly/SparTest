//
//  ListItemView.swift
//  SparTest
//
//  Created by mix on 08.08.2024.
//

import SwiftUI

struct ListItemView: View {
    
    let index: Int
    let item: StoreItem
    @State var counter: Double = 0.0
    @State var bucketIsNotEmpty = false
    @Environment(DataManager.self) private var dataManager
    private let calculate = Calculate()
    
    private func toggleFavorite() {
        dataManager.storeItems[index].isFavorite.toggle()
    }
    
    private func cheсkBusket() {
        bucketIsNotEmpty = dataManager.busket.contains(where: { $0.id == item.id })
    }
    
    private func removeItemFromBusket() {
        if let index = dataManager.busket.firstIndex(where: { $0.id == item.id }) {
            dataManager.busket.remove(at: index)
        }
    }
    
    private func updateBusket() {
        removeItemFromBusket()
        dataManager.busket.append(BusketItem(id: item.id, title: item.title, price: item.price, amount: counter, unit: item.unit))
    }
    
    var body: some View {
        
        HStack(alignment: .center, content: {
            ZStack(alignment: .leading, content: {
                Image(item.imageName)
                    .resizable()
                    .frame(width: 140, height: 140)
                VStack(alignment: .leading) {
                    item.promo.map { PromoItem(promo: $0) } // если промо не nil то создается view
                    Spacer()
                    HStack(content: {
                        Spacer()
                        if let sale = item.sale {
                            Text(String(sale) + "%")
                                .bold()
                                .foregroundStyle(Color.sale)
                        }
                    })
                }
                .frame(width: 144, height: 144)
            })
            .frame(width: 144, height: 144)
            .clipShape(.rect(cornerRadius: 8))
            
            VStack(alignment: .leading, content: {
                HStack(content: {
                    VStack(alignment: .leading, content: {
                        HStack(spacing: 2, content: {
                            Image("star")
                                .resizable()
                                .renderingMode(.original)
                                .tint(.yellow)
                                .frame(width: 16, height: 16)
                            Text(String(item.rating))
                                .font(.system(size: 12))
                            Rectangle()
                                .fill(Color.icons.opacity(0.6))
                                .frame(width: 1, height: 16)
                            Text(String(item.raitingVotesCounter) + "отзывов")
                                .colorMultiply(Color.icons.opacity(0.6))
                                .font(.system(size: 12))
                            Spacer()
                        })
                        Text(item.title)
                            .font(.system(size: 12))
                            .lineLimit(0)
                        if let from = item.importedFrom {
                            let separatedFrom = calculate.separateStringsWithFlag(inputString: from.rawValue)
                            HStack(spacing: 2) {
                                Text(separatedFrom.first ?? "")
                                    .font(.system(size: 12))
                                    .colorMultiply(Color.icons.opacity(0.6))
                                Text(separatedFrom.last ?? "")
                                    .font(.system(size: 12))
                            }
                            .padding(.top, 2)
                        }
                        Spacer()
                    })
                    
                    
                    VStack(alignment: .center, spacing: 0, content: {
                        Group {
                            Button(action: {
                            }, label: {
                                Image("list")
                            })
                            Button(action: {
                                toggleFavorite()
                            }, label: {
                                if item.isFavorite {
                                    Image("heart.filled")

                                } else {
                                    Image("heart")
                                }
                            })
                        }.padding(8)
                            Spacer()
                    })
                })
                
                HStack(spacing: -2, content: {
                    VStack(alignment: .leading, content: {
                        let separetedPrice = calculate.convertToArray(price: item.price)
                        HStack(alignment: .center, spacing: 2, content:  {
                            Text(separetedPrice.first ?? "")
                                .font(.system(size: 20))
                                .bold()
                            Text(separetedPrice.last ?? "")
                                .font(.system(size: 16))
                                .bold()
                            Image("perAmountIcon")
                                .resizable()
                                .frame(width: 20, height: 20)
                        })
                        .frame(height: 22)
                        Text(calculate.convertToSrting(price: item.oldPrice))
                            .colorMultiply(Color.icons.opacity(0.6))
                            .font(.system(size: 12))
                            .strikethrough()
                    })
                    Spacer()
                    Button(action: {
                        calculate.changeCounter(isAdding: true, counter: &counter, unit: item.unit)
                        updateBusket()
                        cheсkBusket()
                    }, label: {
                        Image("basket")
                            .padding(.horizontal, 14)
                            .padding(.vertical, 10)
                    })
                    .background(Color.primaryButton)
                    .clipShape(.rect(cornerRadius: 40))
                })
                .frame(height: 36)
            })
            .padding(.horizontal, 8)
            .padding(.bottom, 5)
    })
        .padding(.horizontal, -2)
        .padding(.vertical)
        .frame(maxWidth: .infinity, maxHeight: 176)
        
    }
}

//#Preview {
//    ListItemView()
//}
