//
//  StructureDataView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/13.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct StructureDataView: View {
    
    var animation: Namespace.ID
    let item: StructureData
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            StructureShapeView(animation: animation, item: item)
                .zIndex(1)
            if !item.children.isEmpty && item.isShowChildren {
                HStack(alignment: .top, spacing: 50) {
                    ForEach(item.children) { item in
                        StructureDataView(animation: animation, item: item)
                    }
                }
                .transition(.scale.combined(with: .opacity))
            }
        }
    }
}

struct StructureDataView_Previews: PreviewProvider {
    @Namespace static var animation
    static var previews: some View {
        StructureDataView(animation: animation, item: .dummy())
    }
}
