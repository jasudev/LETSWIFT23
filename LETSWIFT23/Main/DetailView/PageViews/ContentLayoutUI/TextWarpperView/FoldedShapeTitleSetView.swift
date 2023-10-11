//
//  FoldedShapeTitleSetView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/03.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct FoldedShapeTitleSetView: View {
    
    let data: TitleSetData
    var size: CGSize = CGSize(width: 200, height: 220)
    var fillColor: Color = Color.primaryLevel5
    var outlineColor: Color = Color.black
    var lineWidth: CGFloat = 2
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Spacer()
            if let title = data.title {
                Text(title)
                    .setFont(sizeType: .description1, weight: .bold)
                    .foregroundColor(Color.pointYellow)
            }
            VStack(spacing: 0) {
                Text(data.subtitle)
                    .setFont(sizeType: .description2, weight: .regular)
                    .multilineTextAlignment(.center)
                Spacer()
            }
        }
        .frame(width: size.width, height: size.height)
        .clipped()
        .foldedShape( color: fillColor, outlineColor: outlineColor, lineWidth: lineWidth)
        
    }
}

struct FoldedShapeTitleSetViewPreviews: PreviewProvider {
    static var previews: some View {
        FoldedShapeTitleSetView(data: TitleSetData(title: "텍스트", subtitle: "텍스트입니다."), size: CGSize(width: 200, height: 220))
    }
}
