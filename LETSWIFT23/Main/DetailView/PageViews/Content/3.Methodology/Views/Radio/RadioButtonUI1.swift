//
//  RadioButtonUI1.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/26.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct RadioButtonUI1: View {
    
    var animation: Namespace.ID
    @Binding var selection: Int?
    let index: Int
    let data: HRadioComp1Data
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(data.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .setFont(sizeType: .caption1, weight: .semibold)
                    .matchedGeometryEffect(id: "title\(index)", in: animation)
                Spacer()
                RadioItem(tag: index)
                    .matchedGeometryEffect(id: "icon\(index)", in: animation)
            }
            Text(data.subtitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .setFont(sizeType: .caption3, weight: .regular)
                .opacity(0.5)
                .padding(.bottom, 12)
                .matchedGeometryEffect(id: "subtitle\(index)", in: animation)
            Text(data.price)
                .frame(maxWidth: .infinity, alignment: .leading)
                .setFont(sizeType: .caption1, weight: .regular)
                .matchedGeometryEffect(id: "price\(index)", in: animation)
        }
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .stroke(lineWidth: 2)
                .fill(index == selection ? Color.primaryLevel2 : Color.white.opacity(0.3))
                .matchedGeometryEffect(id: "overLine\(index)", in: animation)
        }
        .foregroundColor(index == selection ? Color.primaryLevel2 : Color.white.opacity(0.8))
        .background(
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(index == selection ? Color.primaryLevel2.opacity(0.07) : Color.clear)
                .matchedGeometryEffect(id: "background\(index)", in: animation)
            
        )
        .contentShape(Rectangle())
        .radioTag(index)
    }
}

struct RadioButtonUI1_Previews: PreviewProvider {
    static var previews: some View {
        HRadio1()
            .modifier(PreviewModifier())
    }
}
