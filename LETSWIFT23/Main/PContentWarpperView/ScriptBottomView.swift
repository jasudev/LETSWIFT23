//
//  ScriptBottomView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/31.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct ScriptBottomView: View {
    
    @EnvironmentObject private var store: PContentStore
    let data: PModel
    
    var body: some View {
        HStack {
            Spacer()
            Text("\(data.id + 1)/\(store.flattenedDatas.count)") { string in
                string.foregroundColor = .level4
                if let range = string.range(of: "\(data.id + 1)") {
                    string[range].foregroundColor = .level2
                }
            }
            .setFont(sizeType: .caption3, weight: .regular)
        }
        .fixedSize()
        .padding(10)
    }
}

struct ScriptBottomView_Previews: PreviewProvider {
    static var previews: some View {
        ScriptBottomView(data: .dummy())
            .modifier(PreviewModifier())
    }
}
