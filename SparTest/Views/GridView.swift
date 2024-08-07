//
//  GridView.swift
//  SparTest
//
//  Created by mix on 07.08.2024.
//

import SwiftUI

struct GridView: View {
    
    @Environment(DataManager.self) private var dataManager
    
    private let grid = [
        GridItem(.adaptive(minimum: 168))
    ]
    
    var body: some View {
        
        ScrollView(.vertical) {
            LazyVGrid(columns: grid, spacing: 8,  content: {
                ForEach(Array(dataManager.storeItems.enumerated()), id: \.element) { index, item in
                    GridItemView(index: index, isVetical: true, item: item)
                }
            })
            .padding(.horizontal)
        }

    }
}

#Preview {
    GridView()
}
