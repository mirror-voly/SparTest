//
//  PromoItem.swift
//  SparTest
//
//  Created by mix on 07.08.2024.
//

import SwiftUI

struct PromoItem: View {
    
    let promo: StoreItem.Promo

    
    var body: some View {
        
        let color: Color = {
            switch promo {
            case .hit: Color.promoRed
            case .new: Color.promoBlue
            case .cart: Color.promoGreen
            }
        }()
        
        HStack(spacing:-10, content: {
                Rectangle()
                    .fill(color)
                    .frame(width: 25)
                Text(promo.rawValue)
                .frame(maxHeight: .infinity)
                    .colorInvert()
                    .font(.system(size: 12))
                    .padding(.trailing, 6)
                    .lineLimit(1)
                    .background(color)
                    .clipShape(.rect(cornerRadius: 12))
            })
                .frame(maxHeight: 16)
                
    }
}

#Preview {
    PromoItem(promo: .hit)
}
