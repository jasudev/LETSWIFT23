//
//  PBottomView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/24.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct PBottomView: View {
    
    @EnvironmentObject private var store: PContentStore
    
    var body: some View {
        HStack(spacing: 0) {
            Text("\(store.currentData.id + 1) / \(store.flattenedDatas.count)") { string in
                string.foregroundColor = .level3
                if let range = string.range(of: "\(store.currentData.id + 1)") {
                    string[range].foregroundColor = .level1
                }
            }
            .setFont(sizeType: .caption3, weight: .regular)
            Spacer()
            Image("logo-light")
                .resizable()
                .scaledToFit()
                .frame(height: 40)
        }
        .padding(.horizontal, PADDING_HORIZONTAL)
        .padding(.bottom, 26)
    }
}

struct PBottomView_Previews: PreviewProvider {
    static var previews: some View {
        PBottomView()
            .modifier(PreviewModifier())
    }
}
