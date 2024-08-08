//
//  RootView.swift
//  SparTest
//
//  Created by mix on 06.08.2024.
//

import SwiftUI

struct RootView: View {
    

    
    @State var gridPresentetion = true
    
    var body: some View {
        
        
        NavigationStack {
            Divider()
            Group {
                if gridPresentetion {
                    GridView()
                } else {
                    ListView()
                }
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
        .onAppear {
            let familyNames = UIFont.familyNames
            
            // Перебираем каждое семейство шрифтов
            for family in familyNames {
                print("Font Family: \(family)")
                
                // Получаем имена шрифтов для текущего семейства
                let fontNames = UIFont.fontNames(forFamilyName: family)
                
                // Перебираем и выводим имена шрифтов
                for fontName in fontNames {
                    print("  Font Name: \(fontName)")
                }
            }
        }
        
    }
}

#Preview {
    RootView()
}
