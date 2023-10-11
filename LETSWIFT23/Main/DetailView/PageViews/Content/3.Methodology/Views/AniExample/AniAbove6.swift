//
//  AniAbove6.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/06.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct AniAbove6: View {
    
    let indexValue: Int
    @Namespace var animation
    @EnvironmentObject private var store: PContentStore
    
    var body: some View {
        GeometryReader { geo in
            HStack(alignment: .top, spacing: 0) {
                if indexValue >= 7 {
                    LineLShape()
                        .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                        .fill(Color.pointYellow)
                        .frame(height: geo.size.height * 0.6)
                        .offset(y: -geo.size.height * 0.33)
                } else {
                    Spacer()
                }
                
                FoldedShapeTitleSetView(data: TitleSetData(title: "Auxiliary(보조 효과)", subtitle: ".transition,\n.matchedGeometryEffect\n수정자로 적용"), size: CGSize(width: 380, height: 230), fillColor: Color.primaryLevel6, outlineColor: indexValue >= 7 ? Color.pointYellow : Color.black, lineWidth: 2)
                
                if indexValue >= 7 {
                    LineLShape()
                        .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                        .fill(Color.pointYellow)
                        .frame(height: geo.size.height * 0.6)
                        .offset(y: -geo.size.height * 0.33)
                        .scaleEffect(x: -1)
                } else {
                    Spacer()
                }
            }
        }
        .padding(.horizontal, store.contentSize.width * 0.09)
        .transition(.scale.combined(with: .opacity))
    }
}

struct LineLShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        return path
    }
}

struct AniAbove6_Previews: PreviewProvider {
    static var previews: some View {
        AniAbove6(indexValue: 5)
    }
}
