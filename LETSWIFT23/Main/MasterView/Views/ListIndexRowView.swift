//
//  ListIndexRowView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct ListIndexRowView: View {
    
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
            HStack(spacing: 6) {
                Circle()
                    .fill(Color.primaryLevel1)
                    .frame(width: 3)
                Text(data.title)
            }
            .setFont(sizeType: isIndexView ? .caption1 : .caption2, weight: .regular)
            .foregroundColor(isSelected || isHover ? .level1 : .level3)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .padding(.leading, 16)
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 6, style: .continuous)
                    .fill(isSelected || isHover ? Color.primaryLevel2.opacity(0.2) : Color.clear)
                RoundedRectangle(cornerRadius: 6, style: .continuous)
                    .stroke()
                    .fill(isSelected || isHover ? Color.primaryLevel2 : Color.clear)
            }
                .offset(y: -1)
        )
        .padding(.horizontal, 16)
        .contentShape(Rectangle())
        .whenHovered { value in
            if value {
                store.hoverData = data
            } else {
                store.hoverData = nil
            }
        }
    }
}

struct ListIndexRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListIndexRowView(data: PModel.dummy(), isIndexView: true)
            .modifier(PreviewModifier())
    }
}
