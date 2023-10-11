//
//  TitleView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct TitleView: View {
    
    let title: String
    @Namespace var animation
    @State private var isShowAni: Bool = false
    @EnvironmentObject private var store: PContentStore
    
    var body: some View {
        Text(title)
            .setFont(sizeType: .title, weight: .bold)
            .foregroundColor(.primaryLevel2)
            .scaleEffect(isShowAni ? CGSize(width: 1, height: 1) : CGSize(width: 0.1, height: 0.1))
            .opacity(isShowAni ? 1 : 0)
            .padding()
            .overlay {
                if !isShowAni {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(Color.black.opacity(0.2))
                            .matchedGeometryEffect(id: "fill", in: animation)
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke()
                            .fill(Color.primaryLevel4)
                            .matchedGeometryEffect(id: "stroke", in: animation)
                    }
                    .frame(minWidth: store.contentSize.width * 0.5, maxHeight: 120)
                    
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay {
                if isShowAni {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(Color.clear)
                            .matchedGeometryEffect(id: "fill", in: animation)
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke()
                            .fill(Color.primaryLevel4)
                            .matchedGeometryEffect(id: "stroke", in: animation)
                    }
                }
            }
            .padding(.horizontal, PADDING_HORIZONTAL)
            .padding(.vertical, 46)
            .animation(ANIMATION_CONTENT_LEVEL2.delay(0.31), value: isShowAni)
            .onAppear {
                DispatchQueue.main.async {
                    isShowAni = true
                }
            }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: "타이틀")
            .modifier(PreviewModifier())
    }
}
