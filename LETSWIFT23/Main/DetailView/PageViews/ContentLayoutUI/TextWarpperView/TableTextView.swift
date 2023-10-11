//
//  TableTextView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/02.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct TableTextView: View {
    
    var titleTextColor: Color = Color.pointYellow
    let items: [TitleSetData]
    
    var body: some View {
        HStack(spacing: 6) {
            VStack(alignment: .trailing, spacing: 10) {
                ForEach(items) { item in
                    if let title = item.title {
                        Text(title)
                            .foregroundColor(titleTextColor)
                    }
                }
            }
            VStack(alignment: .leading, spacing: 10) {
                ForEach(items) { data in
                    Text(data.subtitle)
                }
            }
        }
    }
}

struct TableTextView_Previews: PreviewProvider {
    static var previews: some View {
        TableTextView(items: [.dummy(), .dummy(), .dummy()])
    }
}
