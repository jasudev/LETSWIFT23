//
//  PieChartRows.swift
//  LETSWIFT23
//  Modified by jasu on 2023/05/28.
//  Created by Nazar Ilamanov on 4/23/21.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct PieChartRows: View {
    
    @EnvironmentObject private var store: PContentStore
    
    @Binding var selectedIndex: Int
    var colors: [Color]
    var names: [String]
    var percents: [String]
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(Array(self.percents.enumerated()), id: \.offset) { index, per in
                HStack {
                    RoundedRectangle(cornerRadius: 5.0, style: .continuous)
                        .fill(self.colors[index])
                        .frame(width: 20, height: 20)
                        .offset(y: 2)
                    Text(self.names[index])
                    Spacer()
                    HStack(alignment: .center) {
                        Text(per)
                            .foregroundColor(Color.white.opacity(0.8))
                            .frame(width: 100, alignment: .trailing)
                    }
                }
                .setFont(sizeType: .description3, weight: .semibold)
                .frame(height: 40)
                .overlay {
                    ZStack {
                        if index == selectedIndex {
                            RoundedRectangle(cornerRadius: 5, style: .continuous)
                                .stroke(lineWidth: 2)
                                .fill(colors[index])
                                .frame(height: 36)
                                .padding(-16)
                        }
                    }
                }
            }
        }
        .animation(.easeInOut(duration: 0.3), value: selectedIndex)
    }
}

struct PieChartRows_Previews: PreviewProvider {
    static var percents = [81, 15, 4]
    static var previews: some View {
        PieChartRows(selectedIndex: .constant(0), colors: [Color.blue, Color.green, Color.orange], names: ["iOS 16", "iOS 15", "이전 버전"], percents: percents.map { String(format: "%.2f%%", $0 * 100 / percents.reduce(0, +)) })
            .frame(maxWidth: 360)
            .padding()
    }
}
