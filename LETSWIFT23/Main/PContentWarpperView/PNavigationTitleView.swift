//
//  PNavigationTitleView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct PNavigationTitleView: View {
    
    @EnvironmentObject private var store: PContentStore
    let fontType: FontSizeType = .caption2
    
    var currentIndex: Int {
        store.getIndex(id: store.currentId) ?? 0
    }
    var body: some View {
        HStack {
            if currentIndex > 0 {
                let data = store.flattenedDatas[currentIndex - 1]
                Button {
                    store.currentId = data.id
                } label: {
                    Text(data.title)
                        .padding(.vertical, 8)
                        .contentShape(Rectangle())
                }
                .buttonStyle(.dsPressButtonStyle())
                Text("·")
            }
            let data = store.flattenedDatas[currentIndex]
            Text(data.title)
                .padding(.vertical, 8)
                .foregroundColor(.primaryLevel2)
                .contentShape(Rectangle())
            
            if currentIndex < store.flattenedDatas.count - 1 {
                let data = store.flattenedDatas[currentIndex + 1]
                Text("·")
                Button {
                    store.currentId = data.id
                } label: {
                    Text(data.title)
                        .padding(.vertical, 8)
                        .contentShape(Rectangle())
                }
                .buttonStyle(.dsPressButtonStyle())
            }
        }
        .setFont(sizeType: fontType, weight: .semibold)
        .foregroundColor(.primaryLevel4)
    }
}

struct PNavigationTitleView_Previews: PreviewProvider {
    static var previews: some View {
        PNavigationTitleView()
            .modifier(PreviewModifier())
    }
}
