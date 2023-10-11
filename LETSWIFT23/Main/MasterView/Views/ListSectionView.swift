//
//  ListSectionView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct ListSectionView: View {
    
    @EnvironmentObject private var store: PContentStore
    let data: PModel
    let isIndexView: Bool
    
    var isSelected: Bool {
        let value = store.currentId == data.id
        return value
    }
    
    var isHover: Bool {
        if let id = store.hoverData?.id, id == data.id {
            return true
        }
        return false
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color.clear
            HStack(spacing: 0) {
                Text(data.title.prefix(3))
                    .foregroundColor(isIndexView ? .pointYellow : .primaryLevel2)
                Text(data.title.suffix(data.title.count - 3))
                    .foregroundColor(isHover ? (isIndexView ? Color.pointYellow : .level1) : .primaryLevel2)
            }
            .setFont(sizeType: isIndexView ? (isHover ? .subtitle2 : .description2) : .caption2, weight: .bold)
            .padding(.vertical, isIndexView ? (isHover ? 6 : 0) : 0)
        }
        .padding(.horizontal, isIndexView ? 16 : 8)
        .padding(.all, 6)
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: isIndexView ? 8 : 6, style: .continuous)
                    .fill(isHover ? isIndexView ? Color.primaryLevel6 : Color.clear : Color.clear)
                RoundedRectangle(cornerRadius: isIndexView ? 8 : 6, style: .continuous)
                    .stroke()
                    .fill(isHover ? Color.primaryLevel2 : Color.clear)
            }
                .offset(y: -1)
        )
        .padding(.horizontal, 16)
        .padding(.top, 16)
        .contentShape(Rectangle())
        .animation(.easeInOut(duration: 0.4), value: isHover)
        .whenHovered { value in
            if !isIndexView {
                if value {
                    store.hoverData = data
                } else {
                    store.hoverData = nil
                }
            }
        }
    }
}

struct ListSectionView_Previews: PreviewProvider {
    static var previews: some View {
        ListSectionView(data: PModel.dummy(), isIndexView: true)
            .modifier(PreviewModifier())
    }
}
