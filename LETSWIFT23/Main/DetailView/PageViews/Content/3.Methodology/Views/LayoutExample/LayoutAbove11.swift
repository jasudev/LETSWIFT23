//
//  LayoutAbove11.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/05.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct LayoutAbove11: View {
    
    let indexValue: Int
    var animation: Namespace.ID
    
    var body: some View {
        Group {
            LayoutExampleView(statusData: LayoutStatusData(starSymbol: (.hidden, .hidden),
                                                           starText: (.hidden, .hidden),
                                                           starVStack: (.normal, .hidden),
                                                           avocadoText: (.hidden, .hidden),
                                                           avocadoSpace: (.hidden, .hidden),
                                                           avocadoImage: (.hidden, .hidden),
                                                           avocadoHStack: (.hidden, .hidden),
                                                           descText: (.hidden, .hidden),
                                                           avocadoVStack: (.hidden, .hidden),
                                                           rootHStack: (.normal, .selected)))
            .matchedGeometryEffect(id: "example1", in: animation)
            .transition(.identity)
            
            if indexValue == 11 {
                LayoutExampleView(statusData: LayoutStatusData(starSymbol: (.normal, .selected),
                                                               starText: (.normal, .selected),
                                                               starVStack: (.normal, .selected),
                                                               avocadoText: (.normal, .selected),
                                                               avocadoSpace: (.normal, .selected),
                                                               avocadoImage: (.normal, .selected),
                                                               avocadoHStack: (.normal, .selected),
                                                               descText: (.normal, .selected),
                                                               avocadoVStack: (.normal, .selected),
                                                               rootHStack: (.hidden, .selected)))
                .transition(.asymmetric(insertion: .move(edge: .top), removal: .identity))
                .padding(.top, 24)
            } else if indexValue == 12 {
                LayoutExampleView(statusData: LayoutStatusData(starSymbol: (.normal, .normal),
                                                               starText: (.normal, .normal),
                                                               starVStack: (.selected, .selected),
                                                               avocadoText: (.normal, .normal),
                                                               avocadoSpace: (.normal, .normal),
                                                               avocadoImage: (.normal, .normal),
                                                               avocadoHStack: (.normal, .selected),
                                                               descText: (.normal, .normal),
                                                               avocadoVStack: (.normal, .selected),
                                                               rootHStack: (.hidden, .selected)))
                .padding(.top, 24)
                .transition(.identity)
            } else if indexValue == 13 {
                LayoutExampleView(statusData: LayoutStatusData(starSymbol: (.normal, .selected),
                                                               starText: (.normal, .selected),
                                                               starVStack: (.normal, .selected),
                                                               avocadoText: (.normal, .normal),
                                                               avocadoSpace: (.normal, .normal),
                                                               avocadoImage: (.normal, .normal),
                                                               avocadoHStack: (.normal, .selected),
                                                               descText: (.normal, .normal),
                                                               avocadoVStack: (.normal, .selected),
                                                               rootHStack: (.hidden, .selected)))
                .padding(.top, 24)
                .transition(.identity)
            } else if indexValue == 14 {
                LayoutExampleView(statusData: LayoutStatusData(starSymbol: (.normal, .normal),
                                                               starText: (.normal, .normal),
                                                               starVStack: (.normal, .selected),
                                                               avocadoText: (.normal, .normal),
                                                               avocadoSpace: (.normal, .normal),
                                                               avocadoImage: (.normal, .normal),
                                                               avocadoHStack: (.normal, .selected),
                                                               descText: (.normal, .normal),
                                                               avocadoVStack: (.selected, .selected),
                                                               rootHStack: (.hidden, .selected)))
                .padding(.top, 24)
                .transition(.identity)
            } else if indexValue == 15 {
                LayoutExampleView(statusData: LayoutStatusData(starSymbol: (.normal, .normal),
                                                               starText: (.normal, .normal),
                                                               starVStack: (.normal, .selected),
                                                               avocadoText: (.normal, .selected),
                                                               avocadoSpace: (.normal, .selected),
                                                               avocadoImage: (.normal, .selected),
                                                               avocadoHStack: (.normal, .selected),
                                                               descText: (.normal, .selected),
                                                               avocadoVStack: (.normal, .selected),
                                                               rootHStack: (.hidden, .selected)))
                .padding(.top, 24)
                .transition(.identity)
            } else if indexValue >= 16 && indexValue < 21 {
                LayoutAbove16(indexValue: indexValue, animation: animation)
            }
        }
    }
}

struct LayoutAbove11_Previews: PreviewProvider {
    @Namespace static var animation
    static var previews: some View {
        LayoutAbove11(indexValue: 11, animation: animation)
    }
}
