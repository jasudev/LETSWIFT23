//
//  HRadio1.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct HRadioComp1Data: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let price: String
    
    static func dummy() -> Self {
        HRadioComp1Data(title: "Standard", subtitle: "4-10 business days", price: "$5.00")
    }
}

struct HRadio1: View {
    
    @State private var selection: Int? = 0
    
    var datas = [
        HRadioComp1Data(title: "Standard", subtitle: "4-10 business days", price: "$5.00"),
        HRadioComp1Data(title: "Express", subtitle: "2-5 business days", price: "$16.00"),
        HRadioComp1Data(title: "Super Fast", subtitle: "1 business days", price: "$25.00")
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Delivery method")
                .setFont(sizeType: .description3, weight: .semibold)
                .foregroundColor(.level2)
            
            Radio(selection: $selection) {
                HStack(spacing: 16) {
                    items()
                }
            } onTapReceive: { _ in
                
            }
            .foregroundColor(.level2)
            .setFont(sizeType: .description3, weight: .regular)
            .animation(.easeInOut, value: selection)
        }
    }
    
    private func items() -> some View {
        ForEach(Array(datas.enumerated()), id: \.offset) { index, data in
            item(index: index, data: data)
        }
    }
    
    private func item(index: Int, data: HRadioComp1Data) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text(data.title)
                    .setFont(sizeType: .caption1, weight: .semibold)
                Spacer()
                RadioItem(tag: index)
            }
            Text(data.subtitle)
                .setFont(sizeType: .caption3, weight: .regular)
                .opacity(0.5)
                .padding(.bottom, 12)
            Text(data.price)
                .setFont(sizeType: .caption1, weight: .regular)
        }
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .stroke(lineWidth: 2)
                .fill(index == selection ? Color.primaryLevel2 : Color.white.opacity(0.3))
        }
        .foregroundColor(index == selection ? Color.primaryLevel2 : Color.white.opacity(0.8))
        .background(
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(index == selection ? Color.primaryLevel2.opacity(0.07) : Color.clear)
        )
        .contentShape(Rectangle())
        .radioTag(index)
    }
}

struct HRadio1_Previews: PreviewProvider {
    static var previews: some View {
        HRadio1()
            .modifier(PreviewModifier())
    }
}
