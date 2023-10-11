//
//  FabulaDetailView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/29.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI
import FabulaItemsProvider

struct FabulaDetailView: View {
    
    @Binding var item: ItemData?
    
    var body: some View {
        if let item = self.item {
            ZStack(alignment: .topTrailing) {
                item.view
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.codeBackground)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .overlay {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .stroke()
                            .fill(Color.primaryLevel5)
                    }
                
                Image(systemName: "xmark.square.fill")
                    .resizable()
                    .scaledToFit()
                    .background(
                        Color.primaryLevel1
                            .padding(6)
                    )
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color.primaryLevel5)
                    .padding(16)
                    .onTapGesture {
                        self.item = nil
                    }
            }
        }
    }
}

struct FabulaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FabulaDetailView(item: .constant(.dummy()))
    }
}
