//
//  FabulaListView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI
import FabulaItemsProvider

public struct FabulaListView: View {
    
    let colors = [Color(hex: 0x1D2EFF), Color(hex: 0xFDF272), Color(hex: 0xBDB2CE), Color(hex: 0xD984B1), Color(hex: 0x229B8C), Color(hex: 0xDE8B91)]
    let trailingPadding: CGFloat = 120
    
    @Environment(\.openURL) private var openURL
    @Environment(\.isMainPresentation) private var isMainPresentation: Bool
    @State private var categoryType: CategoryType?
    @State private var platformType: PlatformType?
    @Binding var selectedItem: ItemData?
    let delta: CGFloat = 0.165
    
    public var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .topLeading) {
                ScrollView(showsIndicators: false) {
                    LazyVStack(spacing: 4) {
                        content(proxy: proxy)
                    }
                }
                let y: CGFloat = CGFloat(ItemsProvider.shared.items.count) * 0.193
                
                let uiuxCount = ItemsProvider.shared.items.filter {$0.category == .uiux}.count
                let playCount = ItemsProvider.shared.items.filter {$0.category == .play}.count
                let studyCount = ItemsProvider.shared.items.filter {$0.category == .study}.count
                infoView(color: colors[0], title: "UIUX", count: uiuxCount, offset: CGPoint(x: proxy.size.width - trailingPadding, y: y))
                    .onTapGesture {
                        guard categoryType != .uiux else {
                            categoryType = nil
                            return
                        }
                        categoryType = .uiux
                    }
                infoView(color: colors[1], title: "PLAY", count: playCount, offset: CGPoint(x: proxy.size.width - trailingPadding, y: y + 100))
                    .onTapGesture {
                        guard categoryType != .play else {
                            categoryType = nil
                            return
                        }
                        categoryType = .play
                    }
                infoView(color: colors[2], title: "STUDY", count: studyCount, offset: CGPoint(x: proxy.size.width - trailingPadding, y: y + 200))
                    .onTapGesture {
                        guard categoryType != .study else {
                            categoryType = nil
                            return
                        }
                        categoryType = .study
                    }
                
                let iOSCount = ItemsProvider.shared.items.filter {$0.platformType == .iOS}.count
                let macOSCount = ItemsProvider.shared.items.filter {$0.platformType == .macOS}.count
                let bothCount = ItemsProvider.shared.items.filter {$0.platformType == .both}.count
                infoView(color: colors[3], title: "both", count: bothCount, offset: CGPoint(x: proxy.size.width / 2, y: y + 50))
                    .onTapGesture {
                        guard platformType != .both else {
                            platformType = nil
                            return
                        }
                        platformType = .both
                    }
                infoView(color: colors[4], title: "iOS", count: iOSCount, offset: CGPoint(x: proxy.size.width / 2, y: y + 150))
                    .onTapGesture {
                        guard platformType != .iOS else {
                            platformType = nil
                            return
                        }
                        platformType = .iOS
                    }
                infoView(color: colors[5], title: "macOS", count: macOSCount, offset: CGPoint(x: proxy.size.width / 2, y: y + 250))
                    .onTapGesture {
                        guard platformType != .macOS else {
                            platformType = nil
                            return
                        }
                        platformType = .macOS
                    }
                
                ZStack(alignment: .bottomTrailing) {
                    Color.clear
                    VStack {
                        Text("Fabula\n")
                            .foregroundColor(Color.fabulaPrimary)
                        + Text("Total ")
                        + Text("\(ItemsProvider.shared.items.count) ")
                            .foregroundColor(Color.fabulaPrimary)
                        + Text("items")
                        qrImage()
                    }
                }
                .setFont(sizeType: .description2, weight: .semibold)
                .padding([.bottom, .trailing], 24)
            }
        }
        .padding()
    }
    
    private func qrImage() -> some View {
        Image("FabulaQR")
            .resizable()
            .scaledToFit()
            .frame(width: 250, height: 250)
            .onTapGesture {
                if let url = URL(string: "https://apps.apple.com/app/id1591155142") {
                    openURL(url)
                }
            }
    }
    
    private func infoView(color: Color, title: String, count: Int, offset: CGPoint) -> some View {
        HStack(alignment: .top, spacing: 4) {
            Rectangle()
                .fill(color)
                .frame(width: 6)
            VStack {
                HStack {
                    Text(title)
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color.fabulaFore1)
                    Spacer()
                }
                HStack {
                    Text("\(count)")
                        .font(.title2)
                        .foregroundColor(Color.fabulaPrimary)
                    Spacer()
                }
            }
            .padding(.top, 3)
            Spacer()
        }
        .frame(width: 130, height: CGFloat(ItemsProvider.shared.items.count) * 0.2)
        .background(
            ZStack {
                Color.fabulaBack1
                color.opacity(0.2)
            }
                .opacity(0.5)
                .cornerRadius(6)
                .overlay(
                    RoundedRectangle(cornerRadius: 6, style: .continuous)
                        .stroke()
                        .fill(color.opacity(0.3))
                )
        )
        .offset(x: offset.x, y: offset.y)
    }
    
    private func content(proxy: GeometryProxy) -> some View {
        ForEach(ItemsProvider.shared.items) { item in
            FabulaListRowView(selectedItem: $selectedItem, item: item, colors: colors)
                .opacity(categoryType == nil ? 1 : (categoryType == item.category ? 1 : 0.5))
                .opacity(platformType == nil ? 1 : (platformType == item.platformType ? 1 : 0.5))
                .background {
                    if isMainPresentation {
                        lineGroupView(item: item, proxy: proxy)
                    } else {
                        EmptyView()
                    }
                }
        }
    }
    
    private func lineGroupView(item: ItemData, proxy: GeometryProxy) -> some View {
        GeometryReader { proxy2 in
            ZStack {
                switch item.category {
                case .uiux:
                    curveLine(endPoint: CGPoint(x: proxy.size.width - trailingPadding,
                                                y: proxy.frame(in: .global).origin.y - (proxy2.frame(in: .global).origin.y) + 100 - CGFloat(item.id) * delta))
                    .foregroundColor(colors[0])
                case .play:
                    curveLine(endPoint: CGPoint(x: proxy.size.width - trailingPadding,
                                                y: proxy.frame(in: .global).origin.y - (proxy2.frame(in: .global).origin.y) + 200 - CGFloat(item.id) * delta))
                    .foregroundColor(colors[1])
                default:
                    curveLine(endPoint: CGPoint(x: proxy.size.width - trailingPadding,
                                                y: proxy.frame(in: .global).origin.y - (proxy2.frame(in: .global).origin.y) + 300 - CGFloat(item.id) * delta))
                    .foregroundColor(colors[2])
                }
            }
            
            ZStack {
                switch item.platformType {
                case .both:
                    curveLine(endPoint: CGPoint(x: proxy.size.width / 2,
                                                y: proxy.frame(in: .global).origin.y - (proxy2.frame(in: .global).origin.y) + 150 - CGFloat(item.id) * delta))
                    .foregroundColor(colors[3])
                case .iOS:
                    curveLine(endPoint: CGPoint(x: proxy.size.width / 2,
                                                y: proxy.frame(in: .global).origin.y - (proxy2.frame(in: .global).origin.y) + 250 - CGFloat(item.id) * delta))
                    .foregroundColor(colors[4])
                default:
                    curveLine(endPoint: CGPoint(x: proxy.size.width / 2,
                                                y: proxy.frame(in: .global).origin.y - (proxy2.frame(in: .global).origin.y) + 350 - CGFloat(item.id) * delta))
                    .foregroundColor(colors[5])
                }
            }
            .frame(width: proxy2.size.width / 2)
        }
        .opacity(0.35)
    }
    
    private func curveLine(endPoint: CGPoint) -> some View {
        VerticalCurveLine(startPoint: CGPoint(x: 0, y: 4), endPoint: endPoint, lineWidth: 1)
    }
}

struct FabulaListView_Previews: PreviewProvider {
    static var previews: some View {
        FabulaListView(selectedItem: .constant(nil))
            .modifier(PreviewModifier())
    }
}

private struct VerticalCurveLine: View {
    let startPoint: CGPoint
    let endPoint: CGPoint
    let lineWidth: CGFloat
    var body: some View {
        GeometryReader { proxy in
            CurveLine(startPoint: startPoint,
                      control1: CGPoint(x: proxy.size.width * 0.5, y: startPoint.y),
                      control2: CGPoint(x: proxy.size.width * 0.5, y: endPoint.y),
                      endPoint: endPoint)
            .stroke(lineWidth: lineWidth)
        }
    }
    
    struct CurveLine: Shape {
        
        var startPoint: CGPoint
        var control1: CGPoint
        var control2: CGPoint
        var endPoint: CGPoint
        
        var animatableData: AnimatablePair<CGPoint.AnimatableData, CGPoint.AnimatableData> {
            get { AnimatablePair(startPoint.animatableData, endPoint.animatableData) }
            set { (startPoint.animatableData, endPoint.animatableData) = (newValue.first, newValue.second) }
        }
        
        func path(in rect: CGRect) -> Path {
            var p = Path()
            
            p.move(to: startPoint)
            p.addCurve(to: endPoint, control1: control1, control2: control2)
            
            return p
        }
    }
}

extension ItemData {
    static func dummy() -> Self {
        ItemData(id: 0,
                 category: .play,
                 section: "gggg",
                 createDate: "2123",
                 title: "타이틀",
                 caption: "caption",
                 creator: "jasu",
                 tags: "tag",
                 view: FAnyView(Text("content")))
    }
}
