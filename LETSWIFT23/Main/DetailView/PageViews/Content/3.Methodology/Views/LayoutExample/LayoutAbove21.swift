//
//  LayoutAbove21.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/05.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct LayoutAbove21: View {
    
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
                                                           rootHStack: (.selected, .selected)))
            .matchedGeometryEffect(id: "example1", in: animation)
            .transition(.identity)
            
            LayoutExampleView(statusData: LayoutStatusData(starSymbol: (.normal, .normal),
                                                           starText: (.normal, .normal),
                                                           starVStack: (.selected, .selected),
                                                           avocadoText: (.normal, .selected),
                                                           avocadoSpace: (.normal, .selected),
                                                           avocadoImage: (.normal, .selected),
                                                           avocadoHStack: (.hidden, .hidden),
                                                           descText: (.normal, .normal),
                                                           avocadoVStack: (.selected, .selected),
                                                           rootHStack: (.hidden, .selected)))
            .matchedGeometryEffect(id: "example2", in: animation)
            .padding(.top, 24)
            .transition(.identity)
            
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
            .matchedGeometryEffect(id: "example3", in: animation)
            .padding(.top, 24)
            .transition(.identity)
        }
    }
}

struct LayoutAbove21_Previews: PreviewProvider {
    @Namespace static var animation
    static var previews: some View {
        LayoutAbove21(indexValue: 21, animation: animation)
    }
}
