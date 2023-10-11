//
//  PGTitle.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/24.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct PGTitle: View {
    
    @EnvironmentObject private var store: PContentStore
    var index: Binding<Int> {
        return $store.currentData.pageIndex
    }
    var indexValue: Int {
        return index.wrappedValue
    }
    
    let title: String
    
    init(_ title: String) {
        self.title = title
    }
    
    var body: some View {
        content()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .pagingOnKeyboardInput(index: index, maxIndex: 0)
    }
    
    func content() -> some View {
        TitleView(title: title)
    }
}

struct PGTitle_Previews: PreviewProvider {
    static var previews: some View {
        PGTitle("타이틀")
            .modifier(PreviewModifier())
    }
}
