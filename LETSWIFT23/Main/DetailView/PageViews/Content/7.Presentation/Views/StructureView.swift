//
//  StructureView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/13.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct StructureView: View {
    
    @Namespace var animation
    @Binding var index: Int
    let startIndex: Int
    var localIndex: Int {
        index - startIndex
    }
    
    @State private var items: [StructureData] = [
        StructureData(title: "S0", type: .section, children: [
            StructureData(title: "S0-0", type: .subsection, children: [
                StructureData(title: "P0", type: .page),
                StructureData(title: "P1", type: .page)
            ]),
            StructureData(title: "S0-1", type: .subsection, children: [
                StructureData(title: "P0", type: .page)
            ])
        ]),
        StructureData(title: "S1", type: .section, children: [
            StructureData(title: "S1-0", type: .subsection, children: [
                StructureData(title: "P0", type: .page),
                StructureData(title: "P1", type: .page),
                StructureData(title: "P2", type: .page)
            ]),
            StructureData(title: "S1-1", type: .subsection),
            StructureData(title: "S1-2", type: .subsection)
        ]),
        StructureData(title: "S2", type: .section, children: [
            StructureData(title: "S2-0", type: .subsection, children: [
                StructureData(title: "P0", type: .page)
            ])
        ])
    ]
    
    @State private var flattenedItems: [StructureData] = []
    
    var body: some View {
        ZStack {
            if localIndex < 3 {
                VStack(spacing: 36) {
                    ForEach(items) { item in
                        StructureDataView(animation: animation, item: item)
                    }
                    Text("···")
                        .font(.system(size: 50))
                        .foregroundColor(Color.primaryLevel1)
                        .matchedGeometryEffect(id: "...", in: animation)
                }
            } else {
                HStack(spacing: 8) {
                    ForEach(Array(flattenedItems.enumerated()), id: \.offset) { index, item in
                        VStack {
                            StructureShapeView(animation: animation, item: item)
                                .frame(height: 70)
                            
                            Text("\(index)")
                                .setFont(sizeType: .description2, weight: .regular)
                                .foregroundColor(Color.white)
                                .overlay(alignment: .bottom) {
                                    if localIndex >= 3 {
                                        if index == localIndex - 3 {
                                            Image(systemName: "arrow.up")
                                                .resizable()
                                                .scaledToFit()
                                                .foregroundColor(Color.pointYellow)
                                                .frame(width: 55, height: 55)
                                                .offset(y: 65)
                                                .matchedGeometryEffect(id: "selected", in: animation)
                                        }
                                    }
                                }
                        }
                    }
                    Text("···")
                        .font(.system(size: 50))
                        .foregroundColor(Color.primaryLevel1)
                        .matchedGeometryEffect(id: "...", in: animation)
                }
            }
        }
        .animation(index == 7 ? ANIMATION_CONTENT_LEVEL2 : ANIMATION_CONTENT_LEVEL3, value: index)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            flattenedItems = getFlattenedItems(items)
        }
        .onChange(of: localIndex) { index in
            switch index {
            case 0: showDepth(false, false)
            case 1: showDepth(true, false)
            case 2..<Int.max: showDepth(true, true)
            default: break
            }
        }
    }
    
    private func getFlattenedItems(_ array: [StructureData]) -> [StructureData] {
        var flattenedArray: [StructureData] = []
        for element in array {
            flattenedArray.append(element)
            flattenedArray.append(contentsOf: getFlattenedItems(element.children))
        }
        return flattenedArray
    }
    
    private func showDepth(_ showSubsection: Bool, _ showPage: Bool) {
        for i in 0..<items.count {
            items[i].isShowChildren = showSubsection
            for j in 0..<items[i].children.count {
                items[i].children[j].isShowChildren = showPage
            }
        }
    }
}

struct StructureView_Previews: PreviewProvider {
    static var previews: some View {
        StructureView(index: .constant(0), startIndex: 0)
    }
}
