//
//  RadioButtonUI2.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/26.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct RadioButtonUI2: View {
    
    var animation: Namespace.ID
    @Binding var selection: Int?
    let index: Int
    let data: HRadioComp1Data
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Spacer()
            HStack {
                Text(data.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .setFont(sizeType: .description2, weight: .semibold)
                    .matchedGeometryEffect(id: "title\(index)", in: animation)
            }
            Spacer().frame(height: 6)
            Text(data.subtitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .setFont(sizeType: .caption1, weight: .regular)
                .opacity(0.5)
                .padding(.bottom, 12)
                .matchedGeometryEffect(id: "subtitle\(index)", in: animation)
            Group {
                Spacer()
                Spacer()
            }
            HStack {
                Spacer()
                Text(data.price)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .setFont(sizeType: .description1, weight: .regular)
                    .matchedGeometryEffect(id: "price\(index)", in: animation)
                RadioItem(tag: index)
                    .matchedGeometryEffect(id: "icon\(index)", in: animation)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .frame(height: 200)
        .overlay {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(lineWidth: 2)
                .fill(index == selection ? Color.primaryLevel2 : Color.white.opacity(0.3))
                .matchedGeometryEffect(id: "overLine\(index)", in: animation)
        }
        .foregroundColor(index == selection ? Color.primaryLevel2 : Color.white.opacity(0.8))
        .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(index == selection ? Color.primaryLevel2.opacity(0.07) : Color.clear)
                .matchedGeometryEffect(id: "background\(index)", in: animation)
        )
        .contentShape(Circle())
        .radioTag(index)
    }
}

struct RadioButtonUI2_Previews: PreviewProvider {
    static var previews: some View {
        HRadio2()
            .modifier(PreviewModifier())
    }
}
