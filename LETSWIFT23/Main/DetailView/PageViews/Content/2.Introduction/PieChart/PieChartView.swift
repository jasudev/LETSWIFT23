//
//  PieChartView.swift
//  LETSWIFT23
//  Modified by jasu on 2023/05/14.
//  Created by Nazar Ilamanov on 4/23/21.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

public struct PieChartView: View {
    public let title: String
    public let percents: [Double]
    public let names: [String]
    public let formatter: (Double) -> String
    
    public var colors: [Color]
    public var backgroundColor: Color
    
    public var widthFraction: CGFloat
    public var innerRadiusFraction: CGFloat
    
    @State private var selectedIndex: Int = -1
    
    var slices: [PieSliceData] {
        let sum = percents.reduce(0, +)
        var endDeg: Double = 0
        var tempSlices: [PieSliceData] = []
        
        for (i, value) in percents.enumerated() {
            let degrees: Double = value * 360 / sum
            tempSlices.append(PieSliceData(startAngle: Angle(degrees: endDeg), endAngle: Angle(degrees: endDeg + degrees), text: String(format: "%.0f%%", value * 100 / sum), color: self.colors[i]))
            endDeg += degrees
        }
        return tempSlices
    }
    
    public init(title: String, percents: [Double], names: [String], formatter: @escaping (Double) -> String, colors: [Color] = [Color.blue, Color.green, Color.orange], backgroundColor: Color = Color(red: 21 / 255, green: 24 / 255, blue: 30 / 255, opacity: 1.0), widthFraction: CGFloat = 0.75, innerRadiusFraction: CGFloat = 0.60) {
        self.title = title
        self.percents = percents
        self.names = names
        self.formatter = formatter
        
        self.colors = colors
        self.backgroundColor = backgroundColor
        self.widthFraction = widthFraction
        self.innerRadiusFraction = innerRadiusFraction
    }
    
    public var body: some View {
        VStack {
            Spacer()
            Text(title)
                .setFont(sizeType: .description1, weight: .semibold)
                .foregroundColor(.level1)
            ZStack {
                ForEach(Array(self.percents.enumerated()), id: \.offset) { index, _ in
                    PieSlice(pieSliceData: self.slices[index])
                        .scaleEffect(self.selectedIndex == index ? 1.1 : 1)
                        .animation(.easeOut(duration: 0.3), value: self.selectedIndex)
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { _ in
                                    self.selectedIndex = index
                                }
                                .onEnded { _ in
                                    self.selectedIndex = -1
                                }
                        )
                }
            }
            .padding(.vertical, 36)
            PieChartRows(selectedIndex: $selectedIndex, colors: self.colors, names: self.names, percents: self.percents.map { String(format: "%.2f%%", $0 * 100 / self.percents.reduce(0, +)) })
                .frame(maxWidth: 400)
            Spacer()
        }
        .background(self.backgroundColor)
        .foregroundColor(Color.white)
        .frame(maxWidth: 700)
    }
}

struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView(title: "iOS 버전별 사용 현황", percents: [66, 24, 10], names: ["Rent", "Transport", "Education"], formatter: {value in String(format: "$%.2f", value)})
            .frame(width: 400, height: 400)
            .modifier(PreviewModifier())
    }
}
