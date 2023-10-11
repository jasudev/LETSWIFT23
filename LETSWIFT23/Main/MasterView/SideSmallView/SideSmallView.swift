//
//  SideSmallView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct SideSmallView: View {
    
    @EnvironmentObject private var store: PContentStore
    
    var sections: [PModel] {
        return store.getDepthDatas(.section).suffix(store.getDepthDatas(.section).count - 1)
    }
    
    var body: some View {
        HStack(alignment: .verticalAlignment, spacing: 0) {
            Rectangle()
                .fill(Color.clear)
                .frame(width: 0.001, height: 30)
                .overlay {
                    ZStack {
                        RoundedRectangle(cornerRadius: 4, style: .continuous)
                            .fill(Color.white.opacity(0.15))
                        RoundedRectangle(cornerRadius: 4, style: .continuous)
                            .stroke()
                            .fill(Color.primaryLevel4)
                    }
                    .frame(width: 30, height: 30)
                    .offset(x: 30)
                }
                .opacity(store.currentId == 0 ? 0 : 1)
            VStack(alignment: .center, spacing: -15) {
                ForEach(store.flattenedDatas.suffix(store.flattenedDatas.count - 1)) { data in
                    Group {
                        if data.depth == .section {
                            Text(data.title.prefix(2))
                                .setFont(sizeType: .caption2, weight: .semibold)
                                .foregroundColor(.primaryLevel2)
                                .padding()
                                .padding(.top, 16)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    if store.currentId != data.id {
                                        store.currentId = data.id
                                    }
                                }
                        }
                        if data.id == store.currentId {
                            SmallRowView(data: data)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    if store.currentId != data.id {
                                        store.currentId = data.id
                                    }
                                }
                                .alignmentGuide(.verticalAlignment, computeValue: { d in
                                    d[VerticalAlignment.center] }
                                )
                        } else if data.depth == .subsection {
                            SmallRowView(data: data)
                                .onTapGesture {
                                    if store.currentId != data.id {
                                        store.currentId = data.id
                                    }
                                }
                        } else {
                            EmptyView()
                        }
                    }
                }
                .frame(width: MINI_SIDE_BAR_WIDTH)
            }
        }
        .padding(.top, -44)
        .animation(.easeInOut, value: store.currentId)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct SideSmallView_Previews: PreviewProvider {
    static var previews: some View {
        SideSmallView()
            .modifier(PreviewModifier())
    }
}
