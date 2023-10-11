//
//  SmallRowView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct SmallRowView: View {
    
    @EnvironmentObject private var store: PContentStore
    let data: PModel
    
    var isCurrentData: Bool {
        data.id == store.currentData.id
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            Circle()
                .fill(isCurrentData ? Color.pointYellow : Color.primaryLevel2)
                .frame(width: isCurrentData ? 6 : 3)
                .padding(18)
        }
        .contentShape(Rectangle())
    }
}

struct SmallRowView_Previews: PreviewProvider {
    static var previews: some View {
        SmallRowView(data: PModel.dummy())
            .modifier(PreviewModifier())
    }
}
