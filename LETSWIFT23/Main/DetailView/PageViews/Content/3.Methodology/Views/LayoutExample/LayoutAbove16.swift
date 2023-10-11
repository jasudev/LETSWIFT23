//
//  LayoutAbove16.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/05.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct LayoutAbove16: View {
    
    let indexValue: Int
    var animation: Namespace.ID
    
    var body: some View {
        Group {
            LayoutExampleView(statusData: LayoutStatusData(starSymbol: (.normal, .normal),
                                                           starText: (.normal, .normal),
                                                           starVStack: (.normal, .selected),
                                                           avocadoText: (.normal, .selected),
                                                           avocadoSpace: (.normal, .selected),
                                                           avocadoImage: (.normal, .selected),
                                                           avocadoHStack: (.hidden, .hidden),
                                                           descText: (.normal, .normal),
                                                           avocadoVStack: (.normal, .selected),
                                                           rootHStack: (.hidden, .selected)))
            .padding(.top, 24)
            .transition(.identity)
            
            if indexValue == 16 {
                LayoutExampleView(statusData: LayoutStatusData(starSymbol: (.hidden, .hidden),
                                                               starText: (.hidden, .hidden),
                                                               starVStack: (.hidden, .hidden),
                                                               avocadoText: (.normal, .normal),
                                                               avocadoSpace: (.normal, .normal),
                                                               avocadoImage: (.normal, .normal),
                                                               avocadoHStack: (.selected, .selected),
                                                               descText: (.hidden, .hidden),
                                                               avocadoVStack: (.hidden, .selected),
                                                               rootHStack: (.hidden, .selected)))
                .transition(.asymmetric(insertion: .move(edge: .top), removal: .identity))
                .padding(.top, 24)
            } else if indexValue == 17 {
                LayoutExampleView(statusData: LayoutStatusData(starSymbol: (.hidden, .hidden),
                                                               starText: (.hidden, .hidden),
                                                               starVStack: (.hidden, .hidden),
                                                               avocadoText: (.normal, .selected),
                                                               avocadoSpace: (.normal, .selected),
                                                               avocadoImage: (.normal, .selected),
                                                               avocadoHStack: (.normal, .selected),
                                                               descText: (.hidden, .hidden),
                                                               avocadoVStack: (.hidden, .selected),
                                                               rootHStack: (.hidden, .selected)))
                .padding(.top, 24)
                .transition(.identity)
            } else if indexValue == 18 {
                LayoutExampleView(statusData: LayoutStatusData(starSymbol: (.hidden, .hidden),
                                                               starText: (.hidden, .hidden),
                                                               starVStack: (.hidden, .hidden),
                                                               avocadoText: (.selected, .selected),
                                                               avocadoSpace: (.normal, .normal),
                                                               avocadoImage: (.normal, .normal),
                                                               avocadoHStack: (.normal, .selected),
                                                               descText: (.hidden, .hidden),
                                                               avocadoVStack: (.hidden, .selected),
                                                               rootHStack: (.hidden, .selected)))
                .padding(.top, 24)
                .transition(.identity)
            } else if indexValue == 19 {
                LayoutExampleView(statusData: LayoutStatusData(starSymbol: (.hidden, .hidden),
                                                               starText: (.hidden, .hidden),
                                                               starVStack: (.hidden, .hidden),
                                                               avocadoText: (.normal, .normal),
                                                               avocadoSpace: (.selected, .selected),
                                                               avocadoImage: (.normal, .normal),
                                                               avocadoHStack: (.normal, .selected),
                                                               descText: (.hidden, .hidden),
                                                               avocadoVStack: (.hidden, .selected),
                                                               rootHStack: (.hidden, .selected)))
                .padding(.top, 24)
                .transition(.identity)
            } else if indexValue == 20 {
                LayoutExampleView(statusData: LayoutStatusData(starSymbol: (.hidden, .hidden),
                                                               starText: (.hidden, .hidden),
                                                               starVStack: (.hidden, .hidden),
                                                               avocadoText: (.normal, .normal),
                                                               avocadoSpace: (.normal, .normal),
                                                               avocadoImage: (.selected, .selected),
                                                               avocadoHStack: (.normal, .selected),
                                                               descText: (.hidden, .hidden),
                                                               avocadoVStack: (.hidden, .selected),
                                                               rootHStack: (.hidden, .selected)))
                .padding(.top, 24)
                .transition(.identity)
            }
        }
    }
}

struct LayoutAbove16_Previews: PreviewProvider {
    @Namespace static var animation
    static var previews: some View {
        LayoutAbove16(indexValue: 16, animation: animation)
    }
}
