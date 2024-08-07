//
//  ListView.swift
//  SparTest
//
//  Created by mix on 07.08.2024.
//

import SwiftUI

struct ListView: View {
    
    @Environment(DataManager.self) private var dataManager
    
    var body: some View {
        
        ScrollView(.vertical) {
            ForEach(Array(dataManager.storeItems.enumerated()), id: \.element) { index, item in
                GridItemView(index: index, isVetical: false, item: item)
                    .padding(.horizontal)
                Divider()
            }
        }
    }
}

#Preview {
    ListView()
}
