//
//  FabulaListRowView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI
import FabulaItemsProvider

struct FabulaListRowView: View {
    
    @Binding var selectedItem: ItemData?
    let item: ItemData
    let colors: [Color]
    @State private var onHover: Bool = false
    let selectedItemNames = ["ViscosityCanvas", "Circle Text", "Bubble", "LottieUI+Scroller", "AnimateText", "Polygon Shape", "Custom Indicator", "FoldPaper", "Fold/Unfold", "Rectangular Graph", "Joystick", "Curve Line Control", "Pyramid", "Umbrella", "Circle Typo", "Drag 3D"]
    
    var catetoryColor: Color {
        switch item.category {
        case .uiux: return colors[0]
        case .play: return colors[1]
        case .study: return colors[2]
        }
    }
    
    var isSelected: Bool {
        if let selectedItem = selectedItem {
            return selectedItem.id == item.id
        } else {
            return false
        }
    }
    
    var body: some View {
        HStack {
            HStack(spacing: 0) {
                Rectangle()
                    .fill(catetoryColor)
                    .frame(width: 5)
                    .background(Color.fabulaBack1.opacity(0.5))
                Text(" - " + item.title)
                    .setFont(sizeType: .caption3, weight: .regular)
                Circle()
                    .fill(Color.pointYellow)
                    .frame(width: 8, height: 8)
                    .padding(.leading, 6)
                    .opacity(selectedItemNames.contains(item.title) ? 1 : 0)
                Spacer()
                    .frame(width: 150)
            }
            .contentShape(Rectangle())
            .whenHovered { value in
                onHover = value
            }
            .onTapGesture {
                if item.platformType != .iOS {
                    selectedItem = !isSelected ? item : nil
                }
            }
            .background {
                HStack {
                    if onHover || isSelected {
                        LinearGradient(colors: [catetoryColor, Color.clear], startPoint: .leading, endPoint: .trailing)
                    } else {
                        LinearGradient(colors: [Color.background, Color.clear], startPoint: .leading, endPoint: .trailing)
                    }
                    Spacer()
                }
            }
            Spacer()
        }
        .foregroundColor(isSelected ? .white : Color.fabulaFore1)
    }
}

struct FabulaListRowView_Previews: PreviewProvider {
    static let colors = [Color(hex: 0x9CCCE6), Color(hex: 0xebc090), Color(hex: 0xCB9A9F), Color(hex: 0xBDB2CE), Color(hex: 0x295A76), Color(hex: 0xDE8B91)]
    static var previews: some View {
        return FabulaListRowView(selectedItem: .constant(.dummy()), item: ItemData.dummy(), colors: colors)
    }
}
