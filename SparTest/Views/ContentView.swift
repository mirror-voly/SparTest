//
//  ContentView.swift
//  SparTest
//
//  Created by mix on 06.08.2024.
//

import SwiftUI

struct ContentView: View {

    @State var gridPresentetion = true
    var body: some View {
        
        NavigationStack {
            if gridPresentetion {
                GridView()
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
}

#Preview {
    ContentView()
}
