//
//  PGIndex.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct PGIndex: View {
    
    @EnvironmentObject private var store: PContentStore
    var index: Binding<Int> {
        return $store.currentData.pageIndex
    }
    var indexValue: Int {
        return index.wrappedValue
    }
    
    var sections: [PModel] {
        return store.getDepthDatas(.section).dropFirst().dropLast()
    }
    
    var body: some View {
        content()
            .onDisappear {
                store.hoverData = nil
            }
            .onChange(of: indexValue) { index in
                if index >= 1 {
                    store.hoverData = sections[index - 1]
                } else {
                    store.hoverData = nil
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .pagingOnKeyboardInput(index: index, maxIndex: 7)
            .animation(.easeInOut(duration: 0.4), value: store.hoverData)
    }
    
    func content() -> some View {
        VStack {
            Text("CONTENTS")
                .setFont(sizeType: .description2, weight: .semibold)
                .foregroundColor(.primaryLevel2)
            ListIndexView(isIndexView: true, touchable: false)
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: 800)
                .padding(30)
                .overlay {
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke()
                        .fill(Color.primaryLevel2)
                }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct PGIndex_Previews: PreviewProvider {
    static var previews: some View {
        PGIndex()
            .modifier(PreviewModifier())
    }
}
