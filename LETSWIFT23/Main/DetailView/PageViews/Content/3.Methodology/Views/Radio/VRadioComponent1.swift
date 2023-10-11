//
//  VRadioComponent1.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct VRadioComp1Data: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    
    static func dummy() -> Self {
        VRadioComp1Data(title: "Individual", imageName: "person")
    }
}

struct VRadio1: View {
    
    @State private var selection: Int? = 0
    
    var datas = [
        VRadioComp1Data(title: "Individual", imageName: "person"),
        VRadioComp1Data(title: "Team", imageName: "person.2"),
        VRadioComp1Data(title: "Company", imageName: "box.truck")
    ]
    
    var body: some View {
        Radio(selection: $selection) {
            VStack(spacing: 10) {
                items()
            }
        } onTapReceive: { _ in
            
        }
        .foregroundColor(.level2)
        .setFont(sizeType: .description3, weight: .regular)
        .animation(.easeInOut, value: selection)
    }
    
    private func items() -> some View {
        ForEach(Array(datas.enumerated()), id: \.offset) { index, data in
            item(index: index, data: data)
        }
    }
    
    private func item(index: Int, data: VRadioComp1Data) -> some View {
        HStack(alignment: .center) {
            Image(systemName: data.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .opacity(0.6)
                .padding(.trailing)
            VStack(alignment: .leading) {
                HStack {
                    Text(data.title)
                        .setFont(sizeType: .description3, weight: .semibold)
                    Spacer()
                    RadioItem(tag: index)
                }
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

struct VRadio1_Previews: PreviewProvider {
    static var previews: some View {
        VRadio1()
            .modifier(PreviewModifier())
    }
}
