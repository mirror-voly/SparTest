//
//  GridItemView.swift
//  SparTest
//
//  Created by mix on 07.08.2024.
//

import SwiftUI

struct GridItemView: View {
    
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
        if let index = dataManager.busket.firstIndex(where: { $0.id == item.id }) {
            counter = dataManager.busket[index].amount
        }
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
    
    private func isCounterPositive() {
        if counter > 0.1 {
            updateBusket()
        } else {
            removeItemFromBusket()
            bucketIsNotEmpty = false
        }
    }
    
    var body: some View {
            VStack(alignment: .leading, content: {
                ZStack(alignment: .leading, content: {
                    Image(item.imageName)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    VStack(alignment: .leading) {
                            
                        HStack(alignment: .top) {
                            item.promo.map { PromoItem(promo: $0) }  // если промо не nil то создается view
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
                    HStack(content: {
                        if !bucketIsNotEmpty {
                            VStack(alignment: .leading, content: {
                                let separetedPrice = calculate.convertToArray(price: item.price)
                                HStack(alignment: .center, spacing: 2, content:  {
                                    Text(separetedPrice.first ?? "")
                                        .font(.custom("FONTSPRINGDEMO-CeraRoundProRegular", size: 20))
                                        .bold()
                                    Text(separetedPrice.last ?? "")
                                        .font(.custom("FONTSPRINGDEMO-CeraRoundProRegular", size: 16))
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
                        } else {
                            HStack {
                                Button(action: {
                                    calculate.changeCounter(isAdding: false, counter: &counter, unit: item.unit)
                                    isCounterPositive()
                                }, label: {
                                    Text("-")
                                        .foregroundStyle(Color.white)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        .font(.system(size: 25))
                                        .bold()
                                })
                                .frame(width: 40, height: 36, alignment: .center)
                                VStack {
                                    let preparedCounterString = calculate.prepareCounter(counter: counter, unit: item.unit)
                                    let preparedPriceString = calculate.preparePrice(counter: counter, price: item.price)
                                    Text(preparedCounterString + " " + item.unit.rawValue)
                                        .foregroundStyle(Color.white)
                                        .font(.system(size: 16))
                                        .bold()
                                    Text("~" + preparedPriceString + " ₽")
                                        .foregroundStyle(Color.white)
                                        .font(.system(size: 12))
                                        .lineLimit(1)
                                        .frame(maxWidth: .infinity)
                                        .minimumScaleFactor(0.5)
                                }
                                .frame(maxWidth: .infinity)
                                
                                Button(action: {
                                    calculate.changeCounter(isAdding: true, counter: &counter, unit: item.unit)
                                    updateBusket()
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
            .onAppear(perform: {
                cheсkBusket()
            })
            .background(Color.white)
            .clipShape(.rect(cornerRadius: 20))
            .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 0)
            .frame(height: 278)
        
    }
}


//#Preview {
//    GridItemView(item: StoreItem(title: <#T##String#>, importedFrom: <#T##StoreItem.Countries?#>, imageName: <#T##String#>, price: <#T##Double#>, oldPrice: <#T##Double#>, rating: <#T##Double#>, raitingVotesCounter: <#T##Int#>))
//}
