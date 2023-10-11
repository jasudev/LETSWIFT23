//
//  AppleHistoryView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct YearHistoryData: Identifiable {
    let id = UUID()
    let year: String
    let title: String
    let isDarkAges: Bool
}

struct AppleHistoryView: View {
    
    let datas = [
        YearHistoryData(year: "1976", title: "Apple\nfounded", isDarkAges: false),
        YearHistoryData(year: "1984", title: "Macintosh\nlaunched", isDarkAges: false),
        YearHistoryData(year: "1985", title: "NeXT", isDarkAges: true),
        YearHistoryData(year: "1990", title: "WWW", isDarkAges: true),
        YearHistoryData(year: "1996", title: "WebObjects", isDarkAges: true),
        YearHistoryData(year: "1997", title: "Apple\nbuys\nNeXT", isDarkAges: false),
        YearHistoryData(year: "2001", title: "Mac OS X", isDarkAges: false),
        YearHistoryData(year: "2008", title: "iPhone SDK", isDarkAges: false),
        YearHistoryData(year: "2014", title: "Swift", isDarkAges: false),
        YearHistoryData(year: "2019", title: "SwiftUI", isDarkAges: false)
    ]
    
    @Namespace var animation
    @State private var isShow: Bool = false
    @State private var isShow2: Bool = false
    
    let cornerRadius: CGFloat = 3
    @Binding var index: Int
    
    var body: some View {
        HStack(alignment: .bottom) {
            ForEach(Array(datas.enumerated()), id: \.offset) { index, data in
                rowView(index: index, data: data)
                    .animation(.spring().delay(CGFloat(index) * 0.1), value: isShow)
            }
        }
        .frame(height: 300)
        .offset(y: 10)
        .padding()
        .onAppear {
            DispatchQueue.main.async {
                isShow.toggle()
            }
        }
        .onDisappear {
            isShow = false
            isShow2 = false
        }
    }
    
    private func rowView(index: Int, data: YearHistoryData) -> some View {
        VStack {
            Text(data.title)
                .setFont(sizeType: .description3, weight: .regular)
                .foregroundColor(isSelected(data) ? .pointYellow : .primaryLevel2)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .fixedSize()
                .offset(y: isShow ? 0 : CGFloat(index + 1) * 6)
                .opacity(isShow ? 1 : 0)
                .overlay(alignment: .top) {
                    showJobs(data)
                }
            if isSelected(data) {
                Rectangle()
                    .fill(isSelected(data) ? Color.primaryLevel2 : Color.primaryLevel5)
                    .frame(width: 1, height: lineHeight(index: index))
                    .matchedGeometryEffect(id: "line", in: animation)
            } else {
                Rectangle()
                    .fill(Color.primaryLevel6)
                    .frame(width: 1, height: lineHeight(index: index))
            }
            Text(data.year)
                .setFont(sizeType: .description2, weight: .regular)
                .foregroundColor(.level1)
                .padding(.vertical, 3)
                .padding(.horizontal, 10)
                .background(data.isDarkAges ? Color.black : Color.primaryLevel4)
                .overlay {
                    RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                        .stroke()
                        .fill(data.isDarkAges ? Color.primaryLevel4 : Color.clear)
                        .padding(0.5)
                }
                .fixedSize()
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
                .opacity(isShow ? 1 : 0)
                .overlay(alignment: .bottom) {
                    if isSelected(data) {
                        Image(systemName: "arrowtriangle.up.fill")
                            .offset(y: 35)
                            .foregroundColor(Color.pointYellow)
                            .matchedGeometryEffect(id: "arrow", in: animation)
                    }
                }
        }
        .frame(width: 100)
    }
    
    private func lineHeight(index: Int) -> CGFloat {
        index == 5 ? 50 : (index == 0 ? 5 : CGFloat(index * 20))
    }
    
    @ViewBuilder
    private func showJobs(_ data: YearHistoryData) -> some View {
        let size: CGFloat = 100
        ZStack {
            if let imageName = getImageName(data) {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .overlay {
                        Circle()
                            .stroke(lineWidth: 2)
                            .fill(Color.primaryLevel2)
                            .padding(1)
                    }
                    .frame(width: size, height: size)
                    .clipShape(Circle())
                    .offset(y: isShow2 ? -(size + 10) : -(size + 20))
                    .animation(.easeInOut(duration: 0.6).repeatForever(autoreverses: true), value: isShow2)
                    .onAppear {
                        DispatchQueue.main.async {
                            isShow2.toggle()
                        }
                    }
            }
        }
    }
    
    private func getImageName(_ data: YearHistoryData) -> String? {
        if data.year == "1985" && index >= 1 {
            return "Jobs1"
        } else if data.year == "1997" && index >= 2 {
            return "Jobs2"
        }
        return nil
    }
    
    private func isSelected(_ data: YearHistoryData) -> Bool {
        switch index {
        case 1: return "1985" == data.year
        case 2: return "1997" == data.year
        case 3: return "2001" == data.year
        case 4: return "2008" == data.year
        case 5: return "2014" == data.year
        case 6: return "2019" == data.year
        default: return false
        }
        
    }
}

struct AppleHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        AppleHistoryView(index: .constant(0))
            .modifier(PreviewModifier())
    }
}
