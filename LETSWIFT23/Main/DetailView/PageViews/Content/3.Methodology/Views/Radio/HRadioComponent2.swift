//
//  HRadio2.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct HRadioComp2Data: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let imageName: String
    
    static func dummy() -> Self {
        HRadioComp2Data(title: "●●●● 8304", subtitle: "Last time used: Mar 26, 2022", imageName: "BC")
    }
}

struct HRadio2: View {
    
    @State private var selection: Int? = 0
    
    var datas = [
        HRadioComp2Data(title: "●●●● 8304", subtitle: "Last time used: Mar 26, 2022", imageName: "BC"),
        HRadioComp2Data(title: "●●●● 0123", subtitle: "Never used", imageName: "VISA")
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Payment method")
                    .setFont(sizeType: .description3, weight: .semibold)
                    .foregroundColor(.level2)
                Spacer()
                Text("+ Add new card ")
                    .setFont(sizeType: .caption1, weight: .regular)
                    .foregroundColor(Color.blue)
            }
            
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
    
    private func item(index: Int, data: HRadioComp2Data) -> some View {
        HStack(alignment: .top) {
            Image(data.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 33)
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
            }
            Spacer()
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

struct HRadio2_Previews: PreviewProvider {
    static var previews: some View {
        HRadio2()
            .modifier(PreviewModifier())
    }
}
