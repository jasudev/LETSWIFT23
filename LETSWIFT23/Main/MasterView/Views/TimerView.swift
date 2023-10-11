//
//  TimerView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/20.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct TimerView: View {
    
    @EnvironmentObject private var store: PContentStore
    var fontSize: CGFloat = 13
    let maxTime: Int = TIMER_MAX_SECONDS
    @State private var isStart: Bool = false
    @State private var warningValue: CGFloat = 1.0
    
    var body: some View {
        ZStack {
            if let startDate = store.startDate {
                if store.endDate == nil {
                    TimelineView(.periodic(from: startDate, by: 1.0)) { context in
                        let time = Int(context.date.timeIntervalSince1970) - Int(startDate.timeIntervalSince1970)
                        let end = getEndDelta(time)
                        let value = convertSecondsToTime(time)
                        ZStack {
                            Color.clear
                            RoundedRectangle(cornerRadius: 5, style: .continuous)
                                .stroke()
                                .fill(time >= maxTime ? Color.red : Color.primaryLevel2.opacity(0.2))
                            RoundedRectangle(cornerRadius: 5, style: .continuous)
                                .trim(from: 0, to: end)
                                .stroke()
                                .fill(time >= maxTime ? Color.red : Color.pointYellow)
                            
                            if time >= maxTime {
                                Text("\(value)")
                                    .offset(y: 0.5)
                                    .foregroundColor(Color.red)
                                    .opacity(warningValue)
                                    .animation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: warningValue)
                                    .onAppear {
                                        warningValue = 0.3
                                    }
                            } else {
                                Text("\(value)")
                                    .offset(y: 0.5)
                            }
                            
                        }
                    }
                } else if let date = store.endDate {
                    let time = Int(date.timeIntervalSince1970) - Int(startDate.timeIntervalSince1970)
                    let value = convertSecondsToTime(time)
                    ZStack {
                        Color.clear
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .stroke()
                            .fill(Color.primaryLevel2.opacity(0.2))
                        Text("\(value)")
                            .offset(y: 0.5)
                    }
                }
            } else {
                ZStack {
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .stroke()
                        .fill(Color.primaryLevel2.opacity(0.2))
                    Text("00:00")
                        .offset(y: 0.5)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .padding(6)
        .font(.custom("Arial-Bold", size: fontSize))
        .foregroundColor(.level3)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private func getEndDelta(_ time: Int) -> CGFloat {
        var newTime = time
        if time >= maxTime {
            newTime = time - maxTime
        }
        let value = CGFloat(newTime) / CGFloat(maxTime)
        return value
    }
    
    private func secondsValue(_ date: Date) -> Double {
        let seconds = Calendar.current.component(.second, from: date)
        return Double(seconds) / 60
    }
    
    private func convertSecondsToTime(_ timeInSeconds: Int) -> String {
        let hours = timeInSeconds / 3600
        let minutes = (timeInSeconds - hours * 3600) / 60
        let seconds = timeInSeconds % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
