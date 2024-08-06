//
//  ContentView.swift
//  SparTest
//
//  Created by mix on 06.08.2024.
//

import SwiftUI

struct ContentView: View {
  
    
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
    
    @State var gridPresentetion = true
    var body: some View {
        
        NavigationStack {
            
            ScrollView(.vertical) {
                LazyVGrid(columns: grid, spacing: 8,  content: {
                    ForEach(DataManager.storeItems) { item in
                        
                        VStack(alignment: .leading, spacing: 10, content: {
                            ZStack(alignment: .bottomLeading, content: {
                                Image(item.imageName)
                                    .frame(width: 168, height: 168)
                                HStack(spacing: 2, content: {
                                    Image("star")
                                        .resizable()
                                        .renderingMode(.original)
                                        .tint(.yellow)
                                        .frame(width: 16, height: 16)
                                    Text(String(item.rating))
                                        .font(.system(size: 12))
                                })
                                if let promo = item.promo {
                                    Text(promo)
                                }
                            })
                            VStack(alignment: .leading, content: {
                                Text(item.title)
                                    .font(.system(size: 12))
                                    .lineLimit(3)
                                HStack(content: {
                                    VStack(alignment: .leading, content: {
                                        let separetedPrice = convertToArray(price: item.price)
                                        HStack(alignment: .center, spacing: 2, content:  {
                                            Text(separetedPrice.first ?? "")
                                                .font(.system(size: 22))
                                                .bold()
                                            Text(separetedPrice.last ?? "")
                                                .font(.system(size: 16))
                                                .bold()
                                            Image("perAmountIcon")
                                        })
                                        
                                        Text(convertToSrting(price: item.oldPrice))
                                            .font(.system(size: 12))
                                            .strikethrough()
                                    })
                                    Spacer()
                                    Button(action: {
                                        
                                    }, label: {
                                        Image("basket")
                                            .resizable()
                                            .renderingMode(.template)
                                            .tint(.white)
                                        
                                            .frame(width: 16, height: 16)
                                            .padding(.horizontal, 10)
                                            .padding(.vertical, 8)
                                    })
                                    .background(Color.primaryButton)
                                    .clipShape(.rect(cornerRadius: 40))
                                    .frame(width: 48, height: 36, alignment: .center)
                                })
                            })
                        })
                        .frame(height: 278)
                    }
                })
                .padding(.horizontal)
            }
                                
                                
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        gridPresentetion.toggle()
                    }, label: {
                        Group {
                            if gridPresentetion {
                                Image(systemName: "square.grid.2x2")
                            } else {
                                Image(systemName: "rectangle.grid.1x2")
                            }
                        }.fontWeight(.semibold)
                            .frame(width: 40, height: 40)
                            .background(.surfacesMain)
                            .tint(.primaryButton)
                            .clipShape(.rect(cornerRadius: 12))
                    })
                }
            })
            
            
        }
        
        
    }
}

#Preview {
    ContentView()
}
