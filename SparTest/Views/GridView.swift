//
//  GridView.swift
//  SparTest
//
//  Created by mix on 07.08.2024.
//

import SwiftUI

struct GridView: View {
    
    @State var busket: [StoreItem] = []
    
    private let grid = [
        GridItem(.adaptive(minimum: 168))
    ]
    
    func convertToSrting(price: Double) -> String {
        let string = String(price).replacingOccurrences(of: ".", with: ",")
        return string
    }
    
    func convertToArray(price: Double) -> [String] {
        let string = String(format: "%.2f", price)
        let stringArray = string.components(separatedBy: ".")
        return stringArray
    }
    
    func separatStringsWithFlag(inputString: String) -> [String] {
        let strings = inputString.components(separatedBy: ":")
        return strings
    }
    
    var body: some View {
        
        ScrollView(.vertical) {
            LazyVGrid(columns: grid, spacing: 8,  content: {
                ForEach(DataManager.storeItems) { item in
                    
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
                                    VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                                        Group {
                                            Button(action: {
                                            }, label: {
                                                Image("list")
                                            })
                                            Button(action: {
                                            }, label: {
                                                Image("heart")
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
                                            .foregroundStyle(Color.sale)
                                    }
                                })
                                .padding(.horizontal, 5)
                            }
                        })
                        
                        VStack(alignment: .leading, content: {
                            Text(item.title)
                                .font(.system(size: 12))
                                .lineLimit(3)
                            if let from = item.importedFrom {
                                let separatedFrom = separatStringsWithFlag(inputString: from.rawValue)
                                HStack(spacing: 2) {
                                    Text(separatedFrom.first!)
                                        .font(.system(size: 12))
                                        .colorMultiply(Color.icons.opacity(0.6))
                                    Text(separatedFrom.last!)
                                        .font(.system(size: 12))
                                }
                                .padding(.top, 2)
                            }
                            Spacer()
                            HStack(content: {
//                                    if busket.firstIndex(where: item) {
//                                        Text("sssssssssss")
//                                    }
                                VStack(alignment: .leading, content: {
                                    let separetedPrice = convertToArray(price: item.price)
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
                                    Text(convertToSrting(price: item.oldPrice))
                                        .colorMultiply(Color.icons.opacity(0.6))
                                        .font(.system(size: 12))
                                        .strikethrough()
                                })
                                Spacer()
                                Button(action: {
                                    busket.append(item)
                                }, label: {
                                    Image("basket")
                                        .resizable()
                                        .renderingMode(.template)
                                        .tint(.white)
                                        .frame(width: 16, height: 16)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 8)
                                })
                                .background(Color.primaryButton)
                                .clipShape(.rect(cornerRadius: 40))
                                .frame(height: 36)
                            })
                            .frame(maxWidth: .infinity)
                        })
                        .padding(.horizontal, 8)
                        .padding(.bottom, 5)
                    })
                    .background(Color.white)
                    .clipShape(.rect(cornerRadius: 20))
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                    .frame(height: 278)
                }
            })
            .padding(.top)
            .padding(.horizontal)
        }

    }
}

#Preview {
    GridView()
}
