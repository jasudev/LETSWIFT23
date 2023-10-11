//
//  AFHistoryDataView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/31.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct AFHistoryData: Identifiable {
    var id: String {
        year
    }
    let year: String
    var flashIcon: String?
    var flashText: String?
    var eventText: String?
    
    static func dummy() -> Self {
        AFHistoryData(year: "1993",
                      flashText: "FutureWave Software사의 SmartSketch 출시",
                      eventText: "iPhone 출시iPhone 출시iPhone 출시")
    }
}

struct AFHistoryDataView: View {
    
    var animation: Namespace.ID
    let data: AFHistoryData
    let isSelected: Bool
    
    let flashColor = Color.primaryLevel2
    let eventColor = Color.primaryLevel6
    
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading) {
                ZStack {
                    if let flashText = data.flashText {
                        flashTextView(text: flashText, geo: geo)
                            .padding(.top, data.eventText != nil ? 50 : 0)
                            .padding(.bottom, data.eventText != nil ? -50 : 0)
                        
                    } else {
                        Spacer()
                            .frame(maxHeight: .infinity)
                    }
                }
                
                yearTextView(text: data.year)
                    .padding(.top, data.eventText != nil ? 50 : 0)
                
                if let eventText = data.eventText {
                    eventTextView(text: eventText, geo: geo)
                } else {
                    Spacer()
                        .frame(maxHeight: .infinity)
                }
            }
            .setFont(sizeType: .caption1, weight: .semibold)
        }
        .frame(width: 600, height: 330)
    }
    
    private func yearTextView(text: String) -> some View {
        ZStack {
            Color.primaryLevel6
                .overlay(Color.black.opacity(0.2))
                .padding(.top, 3)
                .frame(height: 26)
                .offset(y: -2)
            Text(text)
                .offset(y: isSelected ?  -2 : 0)
                .padding(.vertical, 4)
                .padding(.horizontal, 12)
                .background(
                    ZStack {
                        if isSelected {
                            RoundedRectangle(cornerRadius: 6, style: .continuous)
                                .fill(Color.background)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 6, style: .continuous)
                                        .stroke()
                                        .fill(Color.pointYellow)
                                )
                                .matchedGeometryEffect(id: "textbackground", in: animation)
                        }
                    }
                )
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundColor(isSelected ? Color.pointYellow : Color.primaryLevel1)
                .setFont(sizeType: isSelected ? .description1 : .caption1, weight: .semibold)
        }
    }
    
    private func flashTextView(text: String, geo: GeometryProxy) -> some View {
        VStack(spacing: 0) {
            HStack(spacing: 5) {
                if let icon = data.flashIcon {
                    Image(icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 52, height: 52)
                }
                Text(text)
                    .padding(12)
                    .background(
                        Rectangle()
                            .stroke()
                            .fill(flashColor)
                    )
                    .foregroundColor(flashColor)
                    .frame(width: geo.size.width / 2, alignment: .leading)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .setFont(sizeType: .description3, weight: .semibold)
            .padding(.top, 16)
            Spacer()
        }
        .overlay(alignment: .center) {
            VStack(spacing: 0) {
                Rectangle()
                    .fill(flashColor)
                    .frame(width: 1)
                Circle()
                    .fill(flashColor)
                    .frame(width: 8, height: 8)
            }
            .padding(.top, 20)
            .padding(.bottom, 8)
        }
    }
    
    private func eventTextView(text: String, geo: GeometryProxy) -> some View {
        VStack(spacing: 0) {
            Spacer()
            Text(text)
                .padding(12)
                .background(eventColor)
                .overlay(alignment: .leading) {
                    Rectangle()
                        .fill(Color.primaryLevel4)
                        .frame(width: 1)
                        .padding(.vertical, 1)
                }
                .frame(width: geo.size.width/2, alignment: .trailing)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(isSelected ? Color.pointYellow : Color.primaryLevel1)
                .setFont(sizeType: isSelected ? .description3 : .description3, weight: .semibold)
        }
        .overlay(alignment: .center) {
            VStack(spacing: 0) {
                Circle()
                    .fill(isSelected ? Color.pointYellow : eventColor)
                    .frame(width: 8, height: 8)
                Rectangle()
                    .fill(isSelected ? Color.pointYellow : eventColor)
                    .frame(width: 1)
                    .padding(.bottom, 3)
            }
            .padding(.top, 8)
        }
    }
}

struct AFHistoryDataView_Previews: PreviewProvider {
    @Namespace static var animation
    static var previews: some View {
        AFHistoryDataView(animation: animation, data: .dummy(), isSelected: true)
            .background(Color.background)
    }
}
