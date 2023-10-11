//
//  ListIndexView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct ListIndexView: View {
    
    @EnvironmentObject private var store: PContentStore
    let isIndexView: Bool
    let touchable: Bool
    
    var sections: [PModel] {
        return store.getDepthDatas(.section).dropFirst().dropLast()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(sections) { section in
                ListSectionView(data: section, isIndexView: isIndexView)
                    .onTapGesture {
                        if touchable {
                            if store.currentId != section.id {
                                store.currentId = section.id
                            }
                        }
                    }
                if !isIndexView {
                    ForEach(section.children) { data in
                        ListIndexRowView(data: data, isIndexView: isIndexView)
                            .onTapGesture {
                                if touchable {
                                    if store.currentId != data.id {
                                        store.currentId = data.id
                                    }
                                }
                            }
                            .padding(.vertical, 1)
                    }
                }
            }
        }
    }
}

struct ListIndexView_Previews: PreviewProvider {
    static var previews: some View {
        ListIndexView(isIndexView: false, touchable: true)
            .modifier(PreviewModifier())
    }
}
