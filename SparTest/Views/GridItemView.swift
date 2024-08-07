//
//  GridItemView.swift
//  SparTest
//
//  Created by mix on 07.08.2024.
//

import SwiftUI

struct GridItemView: View {
    
    let index: Int
    let isVetical: Bool
    let item: StoreItem
    @State var counter: Double = 0.1
    @State var inBucket = false
    @Environment(DataManager.self) private var dataManager
    private let calculate = Calculate()
    
    private func toggleFavorite() {
        dataManager.storeItems[index].isFavorite.toggle()
    }
    
    var body: some View {
        
        if isVetical {
            VStack(alignment: .leading, content: {
                ZStack(alignment: .leading, content: {
                    Image(item.imageName)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    VStack(alignment: .leading) {
                            
                        HStack(alignment: .top) {
                            if let promo = item.promo {
                                PromoItem(promo: promo)
                            }
                            Spacer()
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
                            })
                            .background(Color.white.opacity(0.8))
                            .clipShape(.rect(cornerRadius: 20))
                            .padding(.top, 2)
                        }
                        Spacer()
                        HStack(spacing: 2, content: {
                            Image("star")
                                .resizable()
                                .renderingMode(.original)
                                .tint(.yellow)
                                .frame(width: 16, height: 16)
                            Text(String(item.rating))
                                .font(.system(size: 12))
                            Spacer()
                            if let sale = item.sale {
                                Text(String(sale) + "%")
                                    .bold()
                                    .foregroundStyle(Color.sale)
                            }
                        })
                        .padding(.horizontal, 5)
                    }
                })
                
                VStack(alignment: .leading, content: {
                    Text(item.title)
                        .font(.system(size: 12))
                        .lineLimit(0)
                    if let from = item.importedFrom {
                        let separatedFrom = calculate.separatStringsWithFlag(inputString: from.rawValue)
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
                    HStack(content: {
                        if !inBucket {
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
                                dataManager.busket.append(BusketItem(title: item.title, price: item.price, amount: 0.1, units: .piece, id: item.id))
                                if dataManager.busket.first(where: { $0.id == item.id }) != nil {
                                    print("yep")
                                    inBucket = true
                                }
                            }, label: {
                                Image("basket")
                                    .padding(.horizontal, 14)
                                    .padding(.vertical, 10)
                            })
                            .background(Color.primaryButton)
                            .clipShape(.rect(cornerRadius: 40))
                        } else {
                            HStack {
                                Button(action: {
                                    counter -= 0.1
                                    if let index = dataManager.busket.firstIndex(where: { $0.id == item.id }) {
                                        dataManager.busket.remove(at: index)
                                        dataManager.busket.append(BusketItem(title: item.title, price: item.price, amount: counter, units: .piece, id: item.id))
                                    }
                                }, label: {
                                    Text("-")
                                        .foregroundStyle(Color.white)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        .font(.system(size: 25))
                                        .bold()
                                })
                                .frame(width: 40, height: 36, alignment: .center)
                                let formattedString = String(format: "%.1f", counter)
                                VStack {
                                    Text(String(formattedString) + " Кг")
                                        .foregroundStyle(Color.white)
                                        .padding(.vertical, 10)
                                        .font(.system(size: 16))
                                    
                                }
                                .frame(maxWidth: .infinity)
                                
                                Button(action: {
                                    counter += 0.1
                                    if let index = dataManager.busket.firstIndex(where: { $0.id == item.id }) {
                                        dataManager.busket.remove(at: index)
                                        dataManager.busket.append(BusketItem(title: item.title, price: item.price, amount: counter, units: .piece, id: item.id))
                                    }
                                }, label: {
                                    Text("+")
                                        .foregroundStyle(Color.white)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        .font(.system(size: 25))
                                        .bold()
                                })
                                .frame(width: 40, height: 36, alignment: .center)
                            }
                            .frame(maxWidth: .infinity)
                            .background(Color.primaryButton)
                            .clipShape(.rect(cornerRadius: 20))
                            
                            
                        }
                    })
                    .frame(maxWidth: .infinity)
                })
                .padding(.horizontal, 8)
                .padding(.bottom, 5)
            })
            .background(Color.white)
            .clipShape(.rect(cornerRadius: 20))
            .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 0)
            .frame(height: 278)
        }
        
        
        else {
            HStack(alignment: .center, content: {
                ZStack(alignment: .leading, content: {
                    Image(item.imageName)
                        .resizable()
                        .frame(width: 140, height: 140)
                    VStack(alignment: .leading) {
                            if let promo = item.promo {
                                PromoItem(promo: promo)
                            }
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
                                let separatedFrom = calculate.separatStringsWithFlag(inputString: from.rawValue)
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
}


//#Preview {
//    GridItemView(item: StoreItem(title: <#T##String#>, importedFrom: <#T##StoreItem.Countries?#>, imageName: <#T##String#>, price: <#T##Double#>, oldPrice: <#T##Double#>, rating: <#T##Double#>, raitingVotesCounter: <#T##Int#>))
//}
