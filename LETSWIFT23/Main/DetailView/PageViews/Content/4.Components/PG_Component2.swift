//
//  PGComponent2.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/09/20.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct PGComponent2: View {
    
    @EnvironmentObject private var store: PContentStore
    var index: Binding<Int> {
        return $store.currentData.pageIndex
    }
    var indexValue: Int {
        return index.wrappedValue
    }
    private let lastIndex: Int = 8
    @State private var tags = [0]
    
    var body: some View {
        content()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .pagingOnKeyboardInput(index: index, maxIndex: lastIndex)
    }

    @ViewBuilder
    func content() -> some View {
        switch indexValue {
        case 0:
            ComponentTitleView(title: "Checkbox")
                .transition(.scale.combined(with: .opacity))
        case 1...lastIndex:
            HStack {
                if indexValue >= 2 && indexValue <= 7 {
                    ZStack {
                        let fileName = getFileName(indexValue - 2)
                        if indexValue == 3 {
                            codeImageView()
                                .frame(width: store.contentSize.width * 0.7)
                                .transition(.move(edge: .leading).combined(with: .opacity))
                        } else {
                            codeImageView()
                                .roundedTitleLine(fileName, padding: 0)
                                .frame(width: store.contentSize.width * 0.7)
                        }
                    }
                    .transition(.move(edge: .leading).combined(with: .opacity))
                }

                Checkbox(tags: $tags) {
                   VStack(alignment: .leading) {
                      itemView(0)
                      itemView(1)
                      itemView(2)
                   }
                } onTapReceive: { value in
                   print("value: ", value)
                }
                .overlay {
                    if indexValue == 5 {
                        SelectedRoundedView()
                    }
                }
                .transition(.scale.combined(with: .opacity))
                .frame(maxWidth: .infinity)
            }
            .transition(.move(edge: .bottom).combined(with: .opacity))
        default:
            EmptyView()
        }
    }
    
    private func itemView(_ tag: Int) -> some View {
       HStack(spacing: 20) {
          CheckItem(tag: tag, size: 50)
               .overlay {
                   if indexValue == 6 {
                       SelectedRoundedView()
                   }
               }
          Text("Item \(tag + 1)")
             .font(.system(size: 50))
       }
       .padding()
       .overlay {
           if indexValue == 7 {
               SelectedRoundedView()
           }
       }
       .checkTag(tag)
    }

    @ViewBuilder
    private func codeImageView() -> some View {
        let fileName = getFileName(indexValue - 2)
        ZStack(alignment: indexValue == 3 ? .center : .topLeading) {
            Color.clear
            Image(fileName)
                .resizable()
                .scaledToFit()
                .padding(.top, 36)
                .padding(.leading, indexValue == 3 ? 0 : 12)
                .id(UUID())
        }
        .background(indexValue == 3 ? Color.clear : Color.codeBackground2)
        .frame(maxWidth: .infinity, alignment: .topLeading)
    }
    
    private func getFileName(_ idx: Int) -> String {
        let titles = ["CheckboxExample", "CheckboxStructure", "CheckStore", "Checkbox", "CheckItem", "CheckItemModifier"]
        return titles.indices.contains(idx) ? titles[idx] : ""
    }
}

struct PGComponent2_Previews: PreviewProvider {
    static var previews: some View {
        PGComponent2()
            .modifier(PreviewModifier())
    }
}
